import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:instapay_clone/domain/repository/social_signin/social_signin_repository.dart';

class GoogleSignInRepositoryImpl implements SocialSignInRepository {
  @override
  Future<Map<String, dynamic>> socialSigninIn() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    if (googleUser != null) {
      print('name = ${googleUser.displayName}');
      print('email = ${googleUser.email}');
      print('id = ${googleUser.id}');
    }
    // Once signed in, return the UserCredential
    return {
      'email': googleUser?.email,
      'idToken': googleAuth?.accessToken,
    };
  }
}
