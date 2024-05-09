import 'package:edspert_course/domain/repositories/auth_repository.dart';

class IsSignedInWithGoogleUsecase {
  final AuthRepository authRepository;

  IsSignedInWithGoogleUsecase(this.authRepository);

  bool call() {
    return authRepository.isSignedInWithGoogle();
  }
}
