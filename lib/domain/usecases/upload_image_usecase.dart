import 'package:edspert_course/domain/repositories/profile_repository.dart';
import 'package:image_picker/image_picker.dart';

class UploadImageUseCase {
  final ProfileRepository repository;

  UploadImageUseCase(this.repository);

  Future<String?> call(XFile file) {
    return repository.uploadImage(file);
  }
}
