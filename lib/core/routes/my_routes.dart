import 'package:appliction_ec/features/login/presentation/pages/login.dart';
import 'package:appliction_ec/features/signup/presentation/pages/signup.dart';
import 'package:flutter/material.dart';

import '../../features/home/presentation/pages/home.dart';

class RoutesName{
  static const String logIn="/";
  static const String home="home";
  static const String signUp="signup";
}
class AppRoutes{
 static Route onGenerate(RouteSettings settings){
   switch (settings.name){
     case RoutesName.logIn :
       return MaterialPageRoute(builder: (context) => const Login());
     case RoutesName.home :
       return MaterialPageRoute(builder: (context) => const HomeScreen());
     case RoutesName.signUp :
       return MaterialPageRoute(builder: (context) => const Signup());

     default:
       return MaterialPageRoute(builder: (context) => unDefinedRoute());
   }

 }
 static Widget unDefinedRoute(){
   return const Scaffold(
     body: Center(child: Text("Route Not Found")),
   );
 }
}
