import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthHelper {
  // Exception Status Code for FirebaseAuth Exceptions
  static const String USER_NOT_FOUND_EXCEPTION_CODE = "user-not-found";
  static const String WRONG_PASSWORD_EXCEPTION_CODE = "wrong-password";
  static const String EMAIL_ALREADY_IN_USE_EXCEPTION_CODE =
      "email-already-in-use";
  static const String OPERATION_NOT_ALLOWED_EXCEPTION_CODE =
      "operation-not-allowed";
  static const String WEAK_PASSWORD_EXCEPTION_CODE = "weak-password";
  static const String USER_MISMATCH_EXCEPTION_CODE = "user-mismatch";
  static const String INVALID_CREDENTIALS_EXCEPTION_CODE = "invalid-credential";
  static const String INVALID_EMAIL_EXCEPTION_CODE = "invalid-email";
  static const String USER_DISABLED_EXCEPTION_CODE = "user-disabled";
  static const String INVALID_VERIFICATION_CODE_EXCEPTION_CODE =
      "invalid-verification-code";
  static const String INVALID_VERIFICATION_ID_EXCEPTION_CODE =
      "invalid-verification-id";
  static const String REQUIRES_RECENT_LOGIN_EXCEPTION_CODE =
      "requires-recent-login";

  static FirebaseAuth _firebaseAuth;

  // making class singleton
  AuthHelper._privateConstructor();
  static AuthHelper _instance = AuthHelper._privateConstructor();

  factory AuthHelper() {
    return _instance;
  }

  /// get instance of FirebaseAuth.instance
  FirebaseAuth get firebaseAuth {
    if (_firebaseAuth == null) {
      _firebaseAuth = FirebaseAuth.instance;
    }
    return _firebaseAuth;
  }

  /// get stream of Auth Status Changes
  Stream<User> get authStateChanges => firebaseAuth.authStateChanges();

  /// sign in user with given User Credentials
  Future<UserCredential> signInWithCredential(AuthCredential credential) async {
    assert(credential != null, "credentials cannot be null");
    return await firebaseAuth.signInWithCredential(credential);
  }

  /// sign in using Google Auth Provider of FirebaseAuth
  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    // Create a new credential
    final GoogleAuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // Once signed in, return the UserCredential
    return await signInWithCredential(credential);
  }

  /// sign out from FirebaseAuth
  Future<void> signOut() async {
    await firebaseAuth.signOut();
  }

  /// get User instance of currentUser
  User get currentUser {
    return firebaseAuth.currentUser;
  }
}
