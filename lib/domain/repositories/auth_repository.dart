abstract class AuthRepository {
  Future<bool> isRegisteredUseCase(String email);
  Future<bool> isSignedInWithGoogle();
  bool registeredUsecase();
  Future<String?> signInWithGoogleUseCase();
}
