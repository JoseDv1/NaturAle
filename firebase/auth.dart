// ignore_for_file: empty_catches, unused_catch_clause

import 'package:firebase_auth/firebase_auth.dart';
import 'package:naturale_app/firebase/firestore.dart';

class AuthenticationService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  // Sign in with email and password
  Future<User?> signIn(
      {required String email, required String password}) async {
    try {
      UserCredential userCredential =
          await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } on FirebaseAuthException {}
    return null;
  }

  // Sign up with email and password
  Future<User?> signUp(
      {required String email, required String password}) async {
    try {
      UserCredential userCredential =
          await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      // Create a new document for the user with the uid
      await FirestoreService().saveUser(
        uid: userCredential.user!.uid,
        email: email,
        createdAt: userCredential.user!.metadata.creationTime,
      );

      return userCredential.user;
    } on FirebaseAuthException catch (e) {}
    return null;
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  // Get the current user
  User? getCurrentUser() {
    return _firebaseAuth.currentUser;
  }
}
