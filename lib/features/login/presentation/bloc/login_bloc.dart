import 'package:appliction_ec/core/enums/screen_status.dart';
import 'package:appliction_ec/core/error/failures.dart';
import 'package:appliction_ec/features/login/domain/entity/ResponceEntity.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import '../../domain/usecases/login_usecase.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginUseCase loginUseCase;

  LoginBloc(this.loginUseCase) : super(LoginInitState()) {
    on<LoginBottomEvent>((event, emit) async {
      emit(state.copyWith(status: ScreenStatus.loading));

      //     var result= await loginUseCase.call(event.email, event.password)
      var result = await loginUseCase(event.email,
          event.password); //if one func  in class can call class by this way
      result.fold((l) {
        emit(state.copyWith(status: ScreenStatus.failure, failures: l));
      }, (r) {
        emit(state.copyWith(status: ScreenStatus.success, entity: r));
      });
    });
    on<LoginPasswordToggleEvent>((event, emit) {
      emit(state.copyWith(
          isPassword: !state.isPassword,
          suffixIcon: state.isPassword ? CupertinoIcons.eye : CupertinoIcons
              .eye_slash));
    });
  }
}
