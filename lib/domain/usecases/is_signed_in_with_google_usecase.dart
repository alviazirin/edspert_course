import 'package:edspert_course/domain/repositories/auth_repository.dart';

class IsSignedInWithGoogle {
  final AuthRepository authRepository;

  IsSignedInWithGoogle(this.authRepository);

  bool call() {
    return authRepository.isSignedInWithGoogle();
  }
}
