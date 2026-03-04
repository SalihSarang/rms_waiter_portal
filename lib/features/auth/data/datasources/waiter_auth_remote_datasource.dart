import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:rms_shared_package/constants/db_constants.dart';
import 'package:rms_shared_package/models/staff_model/staff_model.dart';
import 'package:rms_shared_package/enums/enums.dart';

abstract class WaiterAuthRemoteDataSource {
  Future<StaffModel?> signIn(String email, String password);
  Future<void> signOut();
  Future<StaffModel?> getCurrentWaiter();
}

class WaiterAuthRemoteDataSourceImpl implements WaiterAuthRemoteDataSource {
  final FirebaseAuth auth;
  final FirebaseFirestore firestore;

  WaiterAuthRemoteDataSourceImpl({required this.auth, required this.firestore});

  @override
  Future<StaffModel?> signIn(String email, String password) async {
    try {
      log('Attempting to sign in waiter with email: $email');
      await auth.signInWithEmailAndPassword(email: email, password: password);
      final waiter = await getCurrentWaiter();
      if (waiter == null) {
        log('User is not a valid waiter. Signing out immediately.');
        await auth.signOut();
        throw Exception('User is not a valid waiter.');
      }
      log('Waiter signed in successfully: ${waiter.name}');
      return waiter;
    } catch (e) {
      log('Error signing in waiter: $e');
      rethrow;
    }
  }

  @override
  Future<void> signOut() async {
    log('Signing out current waiter');
    await auth.signOut();
  }

  @override
  Future<StaffModel?> getCurrentWaiter() async {
    final user = auth.currentUser;

    if (user == null) {
      log('No authenticated user found');
      return null;
    }
    log('Fetching details for user UID: ${user.uid}');
    final docSnapshot = await firestore
        .collection(StaffDbConstants.staff)
        .doc(user.uid)
        .get();

    if (!docSnapshot.exists || docSnapshot.data() == null) {
      log('Waiter document does not exist for UID: ${user.uid}');
      return null;
    }

    final staff = StaffModel.fromMap(docSnapshot.data()!, docSnapshot.id);

    // Ensure the user is actually a waiter
    if (staff.role != UserRole.waiter) {
      log('Authenticated user is not a waiter. Real role: ${staff.role.name}');
      return null;
    }

    log('Waiter document retrieved successfully');
    return staff;
  }
}
