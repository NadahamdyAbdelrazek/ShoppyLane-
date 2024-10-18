import 'package:appliction_ec/features/login/data/models/UserModel.dart';

abstract class RemoteLoginDs{
 Future <UserModel> logIn(String email,String password);
}