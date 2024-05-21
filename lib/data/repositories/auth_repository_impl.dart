import 'dart:developer';

import 'package:edspert_course/data/data_sources/auth_data_source.dart';
import 'package:edspert_course/domain/repositories/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthRepositoryImple implements AuthRepository {
  @override
  Future<bool> isRegisteredUseCase(String email) async {
    return await AuthDataSource().checkIfUserRegistered(email);
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
      return null;
    }
  }

  @override
  bool isSignedInWithGoogle() {
    return FirebaseAuth.instance.currentUser != null;
  }

  @override
  Future<bool> registeredUsecase(Map<String, dynamic> dataUser) async {
    return await AuthDataSource().registerUser(dataUser);
  }

  @override
  User? getDataUser() {
    return FirebaseAuth.instance.currentUser;
  }
}
