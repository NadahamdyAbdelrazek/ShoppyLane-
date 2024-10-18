import 'package:appliction_ec/features/login/presentation/bloc/login_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/enums/screen_status.dart';
import '../../../../core/routes/my_routes.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_string.dart';

class TextFieldWidget extends StatelessWidget {
  TextEditingController password = TextEditingController();
  TextEditingController email = TextEditingController();

  TextFieldWidget({super.key});

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return BlocConsumer<LoginBloc, LoginState>(listener: (context, state) {
      if (state.status == ScreenStatus.loading) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Loading...'),
            duration: Duration(seconds: 1),
          ),
        );
      }
      if (state.status == ScreenStatus.success) {
        Navigator.pushNamed(context, RoutesName.home);
      }
    }, builder: (BuildContext context, LoginState state) {
      return Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppString.userName,
                style: TextStyle(
                  color: AppColors.textColor,
                  fontSize: screenWidth * 0.05,
                ),
              ),
              SizedBox(
                height: screenHeight * .01,
              ),
              TextFormField(
                controller: email,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your name';
                  } else {
                    return null;
                  }
                },
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    filled: true,
                    hintText: AppString.enterName,
                    hintStyle: const TextStyle(color: AppColors.hintTextColor),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15))),
              ),
              SizedBox(
                height: screenHeight * .03,
              ),
              Text(
                AppString.password,
                style: TextStyle(
                  color: AppColors.textColor,
                  fontSize: screenWidth * 0.05,
                ),
              ),
              SizedBox(
                height: screenHeight * .01,
              ),
              TextFormField(

                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your password';
                  } else {
                    return null;
                  }
                },
                keyboardType: TextInputType.visiblePassword,
                obscureText: state.isPassword,
                controller: password,
                decoration: InputDecoration(
                  hintText: AppString.enterPassword,
                  hintStyle: const TextStyle(color: AppColors.hintTextColor),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)),
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)),
                  suffixIcon: IconButton(
                      onPressed: () {
                        BlocProvider.of<LoginBloc>(context).add(LoginPasswordToggleEvent());
                      },
                      icon: Icon(
                        state.isPassword
                            ? CupertinoIcons.eye_slash_fill
                            : CupertinoIcons.eye_fill,
                      )),
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    AppString.forgotPassword,
                    style: TextStyle(
                      color: AppColors.textColor,
                      fontSize: screenWidth * 0.04,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: screenHeight * .05,
              ),
              ElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    BlocProvider.of<LoginBloc>(context)
                        .add(LoginBottomEvent(email.text, password.text));
                  }
                },
                style: ElevatedButton.styleFrom(
                    fixedSize: Size(screenWidth * 1, screenHeight * .06),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                child: Text(
                  AppString.login,
                  style: TextStyle(
                      color: AppColors.backgroundColor,
                      fontWeight: FontWeight.bold,
                      fontSize: screenWidth * 0.05),
                ),
              ),
              SizedBox(
                height: screenHeight * .03,
              ),
              Text.rich(TextSpan(children: [
                TextSpan(
                  text: AppString.haveAccount,
                  style: TextStyle(
                      color: AppColors.textColor,
                      fontSize: screenWidth * 0.04,
                      fontWeight: FontWeight.w500),
                ),
                TextSpan(
                  text: AppString.createAccount,
                  style: TextStyle(
                      color: AppColors.textColor,
                      fontSize: screenWidth * 0.05,
                      fontWeight: FontWeight.bold),
                ),
              ]))
            ],
          ),
        ),
      );
    });
  }
}
