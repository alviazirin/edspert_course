import 'dart:developer';

import 'package:edspert_course/domain/repositories/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthRepositoryImple implements AuthRepository {
  @override
  Future<bool> isRegisteredUseCase(String email) {
    // TODO: implement isRegisteredUseCase
    throw UnimplementedError();
  }

  @override
  Future<bool> registeredUsecase() {
    // TODO: implement registeredUsecase
    throw UnimplementedError();
  }

  @override
  Future<String?> signInWithGoogleUseCase() async {
    try {
      //trigger authentication flow
      final GoogleSignInAccount? googleSignInAccount =
          await GoogleSignIn().signIn();

      //obatain auth details from the request
      final GoogleSignInAuthentication? googleSignInAuthentication =
          await googleSignInAccount?.authentication;

      //create new credential
      final credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication?.accessToken,
          idToken: googleSignInAuthentication?.idToken);

      //once signed in return the usercredentials
      UserCredential userCredentialResult =
          await FirebaseAuth.instance.signInWithCredential(credential);

      return userCredentialResult.user?.email;
    } catch (e) {
      log('$e', name: "errorSignInGoogle");
    }
  }

  @override
  bool isSignedInWithGoogle() {
    return FirebaseAuth.instance.currentUser != null;
  }
}
