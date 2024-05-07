import 'package:edspert_course/domain/repositories/auth_repository.dart';

class SignInWithGoogleUseCase {
  final AuthRepository authRepository;

  SignInWithGoogleUseCase(this.authRepository);

  Future<String?> call() {
    return authRepository.signInWithGoogleUseCase();
  }
}
