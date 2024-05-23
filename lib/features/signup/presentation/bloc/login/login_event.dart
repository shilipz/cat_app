part of 'login_bloc.dart';

@immutable
class LoginEvent {}

final class AuthLogin extends LoginEvent {
  final String email;
  final String password;

  AuthLogin({
    required this.email,
    required this.password,
  });
}
