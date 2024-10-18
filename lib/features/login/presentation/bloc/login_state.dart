part of 'login_bloc.dart';

@immutable
class LoginState {
  ScreenStatus? status;
  ResponseEntity? entity;
  Failures? failures;
  final bool isPassword;
  final bool isConfirmPassword;
  final IconData confirmSuffixIcon;
  final IconData suffixIcon;

  LoginState(
      {
      this.isPassword = true,
      this.isConfirmPassword = true,
      this.confirmSuffixIcon = CupertinoIcons.eye,
      this.suffixIcon = CupertinoIcons.eye,
      this.status,
      this.entity,
      this.failures});

  LoginState copyWith({
    ScreenStatus? status,
    ResponseEntity? entity,
    Failures? failures,
    bool? isPassword,
    bool? isConfirmPassword,
    IconData? confirmSuffixIcon,
    IconData? suffixIcon,
  }) {
    return LoginState(
      status: status ?? this.status,
      entity: entity ?? this.entity,
      failures: failures ?? this.failures,
      isPassword: isPassword ?? this.isPassword,
      isConfirmPassword: isConfirmPassword ?? this.isConfirmPassword,
      suffixIcon: suffixIcon ?? this.suffixIcon,
      confirmSuffixIcon: confirmSuffixIcon ?? this.confirmSuffixIcon,
    );
  }
}

class LoginInitState extends LoginState {
  LoginInitState() : super(status: ScreenStatus.init);
}
