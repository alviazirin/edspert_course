import 'package:edspert_course/domain/repositories/auth_repository.dart';
import 'package:edspert_course/models/user_by_email_response_model.dart';

class RegisterUseCase {
  final AuthRepository authRepository;
  final Map<String, dynamic> dataUser;

  RegisterUseCase(this.authRepository, this.dataUser);

  Future<UserByEmailResponse?> call() async {
    return await authRepository.registeredUsecase(dataUser);
  }
}
