part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

class AuthEventInitial extends AuthEvent {}
