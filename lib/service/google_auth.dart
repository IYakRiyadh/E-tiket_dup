// import 'dart:html';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleAuthServis {
  masukDgnGoogle() async {
    final GoogleSignInAccount? userGoogleAuth = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication googleAuthUser =
        await userGoogleAuth!.authentication;

    final credential = GoogleAuthProvider.credential(
        accessToken: googleAuthUser.accessToken,
        idToken: googleAuthUser.idToken);

    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}
