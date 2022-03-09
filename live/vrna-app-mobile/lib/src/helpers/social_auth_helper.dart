import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'package:vrna_app_mobile/src/models/SocialAccount.model.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class SocialAuthHelper {
  Future<SocialAccount> signInWithGoogle() async {
    final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();
    // googleUser.
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    // // Once signed in, return the UserCredential
    // UserCredential cred =
    //     await FirebaseAuth.instance.signInWithCredential(credential);
    return SocialAccount(
        userId: googleUser.id,
        email: googleUser.email,
        token: googleAuth.accessToken,
        name: googleUser.displayName,
        socialNetwork: 'google.com');
  }

  Future<SocialAccount> signInWithFacebook() async {
    if (kIsWeb) {
      return signInWithFaceBookWeb();
    } else {
      final LoginResult result =
          await FacebookAuth.instance.login(permissions: ['email']);
      final facebookAuthCredential =
          FacebookAuthProvider.credential(result.accessToken.token);
      final graphResponse = await http.get(Uri.parse(
          'https://graph.facebook.com/v2.12/me?fields=name,first_name,last_name,email&access_token=${result.accessToken.token}'));
      final profile = json.decode(graphResponse.body);
      // return await FirebaseAuth.instance
      //     .signInWithCredential(facebookAuthCredential);
      return SocialAccount(
          userId: result.accessToken.userId,
          token: facebookAuthCredential.accessToken,
          email: profile['email'] ?? result.accessToken.userId,
          socialNetwork: facebookAuthCredential.providerId);
    }
  }

  Future<SocialAccount> signInWithFaceBookWeb() async {
    FacebookAuthProvider facebookProvider = FacebookAuthProvider();
    facebookProvider.addScope('email');
    facebookProvider.setCustomParameters({
      'display': 'popup',
    });
    UserCredential cred =
        await FirebaseAuth.instance.signInWithPopup(facebookProvider);
    return SocialAccount(
        userId: cred.user.tenantId,
        name: cred.additionalUserInfo.username,
        token: cred.user.refreshToken,
        email: cred.user.email,
        socialNetwork: 'facebook.com');
  }
}
