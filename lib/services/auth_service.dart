import 'package:ecommerce/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:logger/logger.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final logger = Logger();

  UserModel? _userFromFirebase(User? user) {
    if (user == null) {
      return null;
    } else {
      try {
        return UserModel(
          uid: user.uid,
          email: user.email,
        );
      } catch (e) {
        logger.e('!!Error: Returning UserModel!!');
      }
    }
    return null;
  }

  Stream<UserModel?>? get user {
    try {
      return _firebaseAuth.authStateChanges().map(_userFromFirebase);
    } catch (e) {
      logger.e('!!Error: Get user auth state changes!!');
    }
    return null;
  }

  Future<UserModel?> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return _userFromFirebase(credential.user);
    } catch (e) {
      logger.e('!!Error: Sign in with email and Password!!');
    }
    return null;
  }

  Future<UserModel?> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      if (email.isNotEmpty && password.isNotEmpty) {
        final credential = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
        return _userFromFirebase(credential.user);
      } else {
        return null;
      }
    } catch (e) {
      logger.e('!!Error: Creating User with Email and Password!!');
    }
    return null;
  }

  Future<void> signOut() async {
    try {
      await _firebaseAuth.signOut();
    } catch (e) {
      logger.e('!!Error: Sign out user!!');
    }
  }
}
