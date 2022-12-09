/// {@template sign_up_with_email_and_password_failure}
/// Thrown if during the sign up process if a failure occurs.
/// {@endtemplate}
class SendResetPasswordEmailException implements Exception {
  /// {@macro sign_up_with_email_and_password_failure}
  const SendResetPasswordEmailException([
    this.message = 'An unknown exception occurred.',
  ]);

  /// Create an authentication message
  /// from a firebase authentication exception code.
  /// https://pub.dev/documentation/firebase_auth/latest/firebase_auth/FirebaseAuth/createUserWithEmailAndPassword.html
  factory SendResetPasswordEmailException.fromCode(String code) {
    switch (code) {
      case 'missing-android-pkg-name':
        return const SendResetPasswordEmailException(
            'An Android package name must be provided if the Android app is required to be installed.');
      case 'missing-continue-uri':
        return const SendResetPasswordEmailException(
            'A continue URL must be provided in the request.');

      case 'missing-ios-bundle-id':
        return const SendResetPasswordEmailException(
            'An iOS Bundle ID must be provided if an App Store ID is provided.');

      case 'invalid-continue-uri':
        return const SendResetPasswordEmailException(
            'The continue URL provided in the request is invalid.');

      case 'unauthorized-continue-uri':
        return const SendResetPasswordEmailException(
            'The domain of the continue URL is not whitelisted. Whitelist the domain in the Firebase console.');

      case 'user-not-found':
        return const SendResetPasswordEmailException(
            'No user corresponding to the email address.');

      case 'invalid-email':
        return const SendResetPasswordEmailException(
          'Email is not valid or badly formatted.',
        );
      case 'user-disabled':
        return const SendResetPasswordEmailException(
          'This user has been disabled. Please contact support for help.',
        );
      case 'email-already-in-use':
        return const SendResetPasswordEmailException(
          'An account already exists for that email.',
        );
      case 'operation-not-allowed':
        return const SendResetPasswordEmailException(
          'Operation is not allowed.  Please contact support.',
        );
      case 'weak-password':
        return const SendResetPasswordEmailException(
          'Please enter a stronger password.',
        );
      default:
        return const SendResetPasswordEmailException();
    }
  }

  /// The associated error message.
  final String message;
}
