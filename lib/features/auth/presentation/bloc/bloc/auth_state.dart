part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

class RegisterLoadingState extends AuthState {}

class RegisterSuccessState extends AuthState {
  final String SuccessMessage;

  RegisterSuccessState({required this.SuccessMessage});
}

class RegisterErrorState extends AuthState {
  final String errorMessage;

  RegisterErrorState({required this.errorMessage});
}
