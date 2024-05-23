part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

class AuthEventInitial extends AuthEvent {}

final class IsSignInWithGoogleEvent extends AuthEvent {}

final class SignInWithGoogleEvent extends AuthEvent {}

class RegisterWithGoogleEvent extends AuthEvent {
  final Map<String, dynamic> dataUser;
  RegisterWithGoogleEvent(this.dataUser);
}
