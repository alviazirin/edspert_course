import 'package:edspert_course/models/user_by_email_response_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRepository {
  Future<UserByEmailResponse?> registeredUsecase(Map<String, dynamic> dataUser);
  Future<bool> isRegisteredUseCase(String email);
  bool isSignedInWithGoogle();
  User? getDataUser();
  Future<String?> signInWithGoogleUseCase();
}
