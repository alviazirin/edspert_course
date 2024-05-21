import 'package:edspert_course/domain/repositories/auth_repository.dart';

class IsRegisteredUseCase {
  final AuthRepository authRepository;
  final String email;

  IsRegisteredUseCase(this.authRepository, this.email);

  Future<bool> call() async {
    return authRepository.isRegisteredUseCase(email);
  }
}
