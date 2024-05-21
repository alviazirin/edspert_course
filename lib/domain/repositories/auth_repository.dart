abstract class AuthRepository {
  Future<bool> registeredUsecase(Map<String, dynamic> dataUser);
  Future<bool> isRegisteredUseCase(String email);
  bool isSignedInWithGoogle();
  Future<String?> signInWithGoogleUseCase();
}
