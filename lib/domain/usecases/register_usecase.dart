import 'package:edspert_course/domain/repositories/auth_repository.dart';

class RegisterUseCase {
  final AuthRepository authRepository;
  final Map<String, dynamic> dataUser;

  RegisterUseCase(this.authRepository, this.dataUser);

  Future<bool> call() async {
    return await authRepository.registeredUsecase(dataUser);
  }
}
