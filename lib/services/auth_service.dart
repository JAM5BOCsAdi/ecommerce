import 'package:ecommerce/constants/constants.dart';
import 'package:ecommerce/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:logger/logger.dart';

class AuthService {
  final _firebaseAuth = FirebaseAuth.instance;
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
        logger.e(
          userFromFirebaseError,
          error: e.toString(),
        );
      }
    }
    return null;
  }

  Stream<UserModel?>? get user {
    try {
      return _firebaseAuth.authStateChanges().map(_userFromFirebase);
    } catch (e) {
      logger.e(
        getUserError,
        error: e.toString(),
      );
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
      logger.e(
        signInWithEmailAndPasswordError,
        error: e.toString(),
      );
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
      logger.e(
        createUserWithEmailAndPasswordError,
        error: e.toString(),
      );
    }
    return null;
  }

  Future<void> signOut() async {
    try {
      await _firebaseAuth.signOut();
    } catch (e) {
      logger.e(
        signOutError,
        error: e.toString(),
      );
    }
  }
}
