part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

final class IsSignInWithGoogleLoading extends AuthState {}

final class IsSignInWithGoogleSuccess extends AuthState {}

final class IsSignInWithGoogleError extends AuthState {}

final class SignInGoogleLoading extends AuthState {}

final class SignInGoogleSuccess extends AuthState {}

final class SignInGoogleError extends AuthState {}
