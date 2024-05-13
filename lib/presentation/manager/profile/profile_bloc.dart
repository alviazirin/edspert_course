import 'package:bloc/bloc.dart';
import 'package:edspert_course/domain/usecases/upload_image_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/physics.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final UploadImageUseCase uploadImageUseCase;
  ProfileBloc(this.uploadImageUseCase) : super(ProfileInitial()) {
    on<ProfileEvent>((event, emit) async {
      if (event is UploadImageEvent) {
        emit(UploadImageLoading());
        final uploadImageDownloadUrlResult =
            await uploadImageUseCase.call(event.xfile);
        if (uploadImageDownloadUrlResult != null) {
          emit(UploadImageSuccess(uploadImageDownloadUrlResult));
          return;
        }

        emit(UploadImageError());
      }
    });
  }
}
