abstract class AuthRepository {
  Future<bool> registeredUsecase();
  Future<bool> isRegisteredUseCase(String email);
  bool isSignedInWithGoogle();
  Future<String?> signInWithGoogleUseCase();
}
