import 'package:edspert_course/domain/repositories/auth_repository.dart';

class IsSignedInWithGoogle {
  final AuthRepository authRepository;

  IsSignedInWithGoogle(this.authRepository);

  Future call() {
    return authRepository.isSignedInWithGoogle();
  }
}
