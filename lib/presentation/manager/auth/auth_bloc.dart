import 'package:bloc/bloc.dart';
import 'package:edspert_course/domain/usecases/is_signed_in_with_google_usecase.dart';
import 'package:edspert_course/domain/usecases/sign_in_with_google_usecase.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final IsSignedInWithGoogleUsecase isSignedInWithGoogle;
  final SignInWithGoogleUseCase signInWithGoogleUseCase;
  AuthBloc(this.isSignedInWithGoogle, this.signInWithGoogleUseCase)
      : super(AuthInitialState()) {
    on<AuthEvent>((event, emit) async {
      if (event is IsSignInWithGoogleEvent) {
        emit(SignInGoogleLoading());

        bool isSignedIn = isSignedInWithGoogle();
        await Future.delayed(const Duration(seconds: 3));
        if (isSignedIn) {
          emit(SignInGoogleSuccess());
          return;
        }
        emit(SignInGoogleError());
      }
    });
  }
}
