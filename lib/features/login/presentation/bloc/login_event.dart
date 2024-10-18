part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {}
class LoginBottomEvent extends LoginEvent{
  String email;
  String password;

  LoginBottomEvent(this.email, this.password);
}
class LoginPasswordToggleEvent extends LoginEvent{
  LoginPasswordToggleEvent();
}