import 'package:flutter/foundation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:rms_shared_package/constants/db_constants.dart';
import 'package:rms_shared_package/models/staff_model/staff_model.dart';
import 'package:rms_shared_package/enums/enums.dart';

/// Abstract definition for the Waiter Authentication Data Source.
/// This contract defines the essential operations for managing waiter sessions
/// and retrieving their profile information from the remote backend.
abstract class WaiterAuthRemoteDataSource {
  /// Facilitates the sign-in process for a waiter using their email and password.
  Future<StaffModel?> signIn(String email, String password);

  /// Terminate the current waiter's session and clear local authentication state.
  Future<void> signOut();

  /// Retrieves the current authenticated waiter's profile details.
  Future<StaffModel?> getCurrentWaiter();

  /// Updates the 'lastActive' timestamp for a specific waiter in the database.
  Future<void> updateLastActiveStatus(String uid, DateTime time);
}

/// Implementation of [WaiterAuthRemoteDataSource] using Firebase Services.
/// This class orchestrates communication with Firebase Auth for session management
/// and Cloud Firestore for staff profile synchronization.
class WaiterAuthRemoteDataSourceImpl implements WaiterAuthRemoteDataSource {
  final FirebaseAuth auth;
  final FirebaseFirestore firestore;

  WaiterAuthRemoteDataSourceImpl({required this.auth, required this.firestore});

  @override
  Future<StaffModel?> signIn(String email, String password) async {
    try {
      debugPrint('Initiating authentication sequence for waiter: $email');

      // Perform the core authentication with Firebase.
      await auth.signInWithEmailAndPassword(email: email, password: password);

      // Post-authentication: Verify if the user holds a valid waiter profile.
      final waiter = await getCurrentWaiter();
      if (waiter == null) {
        debugPrint(
          'Security check failed: Authenticated user lacks a valid or active waiter profile. Revoking session.',
        );
        await auth.signOut();
        throw Exception(
          'User is not an authorized waiter or the account has been suspended.',
        );
      }

      debugPrint(
        'Authentication successful. Session established for: ${waiter.name}',
      );
      return waiter;
    } catch (e) {
      debugPrint('Authentication sequence encountered an error: $e');
      rethrow;
    }
  }

  @override
  Future<void> signOut() async {
    debugPrint('Gracefully terminating the current waiter session.');
    await auth.signOut();
  }

  @override
  Future<StaffModel?> getCurrentWaiter() async {
    final user = auth.currentUser;

    if (user == null) {
      debugPrint('Session verification failed: No authenticated user found.');
      return null;
    }

    debugPrint('Synchronizing profile data for UID: ${user.uid}');
    final docSnapshot = await firestore
        .collection(StaffDbConstants.staff)
        .doc(user.uid)
        .get();

    // Validate the existence of the staff profile in the database.
    if (!docSnapshot.exists || docSnapshot.data() == null) {
      debugPrint(
        'Data integrity error: No profile document found for UID: ${user.uid}',
      );
      return null;
    }

    final staff = StaffModel.fromMap(docSnapshot.data()!, docSnapshot.id);

    // Business Logic: Strictly enforce the 'waiter' role for this portal.
    if (staff.role != UserRole.waiter) {
      debugPrint(
        'Authorization denied: User role ${staff.role.name} is not permitted here.',
      );
      return null;
    }

    // Business Logic: Deny access if the waiter's account is marked as inactive.
    if (!staff.isActive) {
      debugPrint(
        'Access restricted: The waiter account for ${staff.name} is currently inactive.',
      );
      return null;
    }

    debugPrint('Profile synchronization complete for ${staff.name}.');
    return staff;
  }

  @override
  Future<void> updateLastActiveStatus(String uid, DateTime time) async {
    try {
      debugPrint('Recording activity beat for UID: $uid');

      await firestore.collection(StaffDbConstants.staff).doc(uid).update({
        'lastActive': time.millisecondsSinceEpoch,
      });

      debugPrint(
        'Activity beat successfully recorded at: ${time.toIso8601String()}',
      );
    } catch (e) {
      debugPrint('Failed to record activity beat for UID: $uid. Error: $e');
      rethrow;
    }
  }
}
