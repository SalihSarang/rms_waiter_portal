import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:rms_shared_package/rms_shared_package.dart';

/// Abstract definition for the Waiter Authentication Data Source.
abstract class WaiterAuthRemoteDataSource {
  Future<StaffModel?> signIn(String email, String password);
  Future<StaffModel?> signInAsDemoWaiter({String? sessionCode});
  Future<void> signOut();
  Future<StaffModel?> getCurrentWaiter();
  Stream<StaffModel?> watchWaiterStatus(String uid);
  Future<void> updateLastActiveStatus(String uid, DateTime time);
}

/// Implementation of WaiterAuthRemoteDataSource using Firebase Services.
class WaiterAuthRemoteDataSourceImpl implements WaiterAuthRemoteDataSource {
  final FirebaseAuth auth;
  final FirebaseFirestore firestore;

  WaiterAuthRemoteDataSourceImpl({required this.auth, required this.firestore});

  @override
  Future<StaffModel?> signIn(String email, String password) async {
    try {
      log('Initiating authentication sequence for waiter: $email');

      if (DemoConfig.isDemoEmail(email)) {
        return await signInAsDemoWaiter();
      }

      await auth.signInWithEmailAndPassword(email: email, password: password);

      final waiter = await getCurrentWaiter();
      if (waiter == null) {
        log('Security check failed: Authenticated user lacks a valid or active waiter profile.');
        await auth.signOut();
        throw Exception(
          'User is not an authorized waiter or the account has been suspended.',
        );
      }

      log('Authentication successful. Session established for: ${waiter.name}');
      return waiter;
    } catch (e) {
      log('Authentication sequence encountered an error: $e');
      rethrow;
    }
  }

  @override
  Future<StaffModel?> signInAsDemoWaiter({String? sessionCode}) async {
    try {
      log('Signing in as Demo Waiter (session: $sessionCode)');
      await DemoAuthBootstrapService.signInOrBootstrapStaffDemo(
        DemoConfig.waiter,
        sessionCode: sessionCode,
        auth: auth,
        firestore: firestore,
      );
      final waiter = await getCurrentWaiter();
      if (waiter == null) {
        throw Exception('Failed to synchronize demo waiter profile.');
      }
      return waiter;
    } catch (e) {
      log('Demo Waiter sign-in error: $e');
      rethrow;
    }
  }

  @override
  Future<void> signOut() async {
    log('Gracefully terminating the current waiter session.');
    await DemoSessionManager.clearSession();
    await auth.signOut();
  }

  @override
  Future<StaffModel?> getCurrentWaiter() async {
    final user = auth.currentUser;

    if (user == null) {
      log('Session verification failed: No authenticated user found.');
      return null;
    }

    log('Synchronizing profile data for UID: ${user.uid}');
    final docSnapshot = await firestore
        .rmsCollection(StaffDbConstants.staff)
        .doc(user.uid)
        .get();

    if (!docSnapshot.exists || docSnapshot.data() == null) {
      log('Data integrity error: No profile document found for UID: ${user.uid}');
      return null;
    }

    final staff = StaffModel.fromMap(docSnapshot.data()!, docSnapshot.id);

    if (staff.role != UserRole.waiter) {
      log('Authorization denied: User role ${staff.role.name} is not permitted here.');
      return null;
    }

    if (!staff.isActive) {
      log('Access restricted: The waiter account for ${staff.name} is currently inactive.');
      return null;
    }

    log('Profile synchronization complete for ${staff.name}.');
    return staff;
  }

  @override
  Stream<StaffModel?> watchWaiterStatus(String uid) {
    return firestore
        .rmsCollection(StaffDbConstants.staff)
        .doc(uid)
        .snapshots()
        .map((docSnapshot) {
          if (!docSnapshot.exists || docSnapshot.data() == null) {
            return null;
          }
          return StaffModel.fromMap(docSnapshot.data()!, docSnapshot.id);
        });
  }

  @override
  Future<void> updateLastActiveStatus(String uid, DateTime time) async {
    try {
      log('Recording activity beat for UID: $uid');

      await firestore.rmsCollection(StaffDbConstants.staff).doc(uid).update({
        'lastActive': time.millisecondsSinceEpoch,
      });

      log('Activity beat successfully recorded at: ${time.toIso8601String()}');
    } catch (e) {
      log('Failed to record activity beat for UID: $uid. Error: $e');
      rethrow;
    }
  }
}
