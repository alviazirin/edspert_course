import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRepository {
  Future<bool> registeredUsecase(Map<String, dynamic> dataUser);
  Future<bool> isRegisteredUseCase(String email);
  bool isSignedInWithGoogle();
  User? getDataUser();
  Future<String?> signInWithGoogleUseCase();
}
