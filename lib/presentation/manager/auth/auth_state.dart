part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

final class AuthInitialState extends AuthState {}

final class IsSignInWithGoogleLoading extends AuthState {}

final class IsSignInWithGoogleSuccess extends AuthState {}

final class IsSignInWithGoogleError extends AuthState {}

final class SignInGoogleLoading extends AuthState {}

final class SignInGoogleSuccess extends AuthState {
  final String email;

  SignInGoogleSuccess(this.email);
}

final class SignInGoogleError extends AuthState {}
