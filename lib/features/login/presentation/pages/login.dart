import 'package:appliction_ec/core/utils/app_colors.dart';
import 'package:appliction_ec/core/utils/app_images.dart';
import 'package:appliction_ec/core/utils/app_string.dart';
import 'package:appliction_ec/features/login/data/datasource/remote/remote_login_ds_impl.dart';
import 'package:appliction_ec/features/login/data/repositery/login_repo_impl.dart';
import 'package:appliction_ec/features/login/domain/usecases/login_usecase.dart';
import 'package:appliction_ec/features/login/presentation/bloc/login_bloc.dart';
import 'package:appliction_ec/features/login/presentation/widgets/text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery
        .of(context)
        .size
        .width;
    var screenHeight = MediaQuery
        .of(context)
        .size
        .height;

    return BlocProvider(
      create: (context) =>
          LoginBloc(LoginUseCase(LoginRepoImpl(RemoteLoginDsImpl()))),
      child:
           Scaffold(
             resizeToAvoidBottomInset: false,
             backgroundColor: AppColors.backgroundColor,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
            ),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.asset(AppImages.shoppingCart,
                    height: screenHeight * .1, width: screenWidth * .1),
                SizedBox(
                  height: screenHeight * .01,
                ),
                Text(
                  textAlign: TextAlign.center,
                  AppString.signIn,
                  style: TextStyle(
                      color: AppColors.textColor,
                      fontSize: screenWidth * 0.07,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: screenHeight * .01,
                ),
                TextFieldWidget(),
              ],
            ),
          )


      );
  }
}
