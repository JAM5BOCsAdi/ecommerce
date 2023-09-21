import 'package:firebase_auth/firebase_auth.dart' show FirebaseAuthException;
import 'package:flutter/foundation.dart' show immutable;

const Map<String, AuthError> authErrorMapping = {
  'user-not-found': AuthErrorUserNotFound(),
  'weak-password': AuthErrorWeakPassword(),
  'invalid-email': AuthErrorInvalidEmail(),
  'operation-not-allowed': AuthErrorOperationNotAllowed(),
  'email-already-in-use': AuthErrorEmailAlreadyInUse(),
  'requires-recent-login': AuthErrorRequiresRecentLogin(),
  'no-current-user': AuthErrorNoCurrentUser(),
};

@immutable
abstract class AuthError {
  final String errorTitle;
  final String errorText;

  const AuthError({
    required this.errorTitle,
    required this.errorText,
  });

  factory AuthError.from(FirebaseAuthException exception) =>
      authErrorMapping[exception.code.toLowerCase().trim()] ??
      const AuthErrorUnknown();
  // Another way:
  // AuthErrorUnknown(exception);
}

@immutable
class AuthErrorUnknown extends AuthError {
  // Another way:
  // final FirebaseAUthException innerException;
  // const AuthErrorUnknown(this.innerException);
  // ...
  const AuthErrorUnknown()
      : super(
            errorTitle: 'Authentication error',
            errorText: 'Unknown authentication error');
}

// no-current-user
@immutable
class AuthErrorNoCurrentUser extends AuthError {
  const AuthErrorNoCurrentUser()
      : super(
            errorTitle: 'No current user!',
            errorText: 'No current user with this information was found!');
}

// requires-recent-login
@immutable
class AuthErrorRequiresRecentLogin extends AuthError {
  const AuthErrorRequiresRecentLogin()
      : super(
          errorTitle: 'Required recent login',
          errorText:
              'You need to log out and log back in again in order to preform this operation',
        );
}

// operation-not-allowed
// Email-Password sign in is not enabled, remember to enable it before running the code.
@immutable
class AuthErrorOperationNotAllowed extends AuthError {
  const AuthErrorOperationNotAllowed()
      : super(
          errorTitle: 'Operation not allowed',
          errorText: 'You can not register using this method at this moment!',
        );
}

// user-not-found
@immutable
class AuthErrorUserNotFound extends AuthError {
  const AuthErrorUserNotFound()
      : super(
          errorTitle: 'User not found',
          errorText: 'The given user was not found on the server!',
        );
}

// weak-password
@immutable
class AuthErrorWeakPassword extends AuthError {
  const AuthErrorWeakPassword()
      : super(
          errorTitle: 'Weak password',
          errorText:
              'Please choose a stronger password consisting of more characters!',
        );
}

// invalid-email
@immutable
class AuthErrorInvalidEmail extends AuthError {
  const AuthErrorInvalidEmail()
      : super(
          errorTitle: 'Invalid email',
          errorText: 'Please double check you email and try again!',
        );
}

// email-already-in-use
@immutable
class AuthErrorEmailAlreadyInUse extends AuthError {
  const AuthErrorEmailAlreadyInUse()
      : super(
          errorTitle: 'Email already in use',
          errorText: 'Please choose another email to register with!',
        );
}
