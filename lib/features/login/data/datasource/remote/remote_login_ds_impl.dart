import 'package:appliction_ec/core/api/api_manager.dart';
import 'package:appliction_ec/core/api/end_points.dart';
import 'package:appliction_ec/features/login/data/datasource/remote/remote_login_ds.dart';
import 'package:appliction_ec/features/login/data/models/UserModel.dart';

class RemoteLoginDsImpl implements RemoteLoginDs {
  @override
  Future<UserModel> logIn(String email, String password) async {
    ApiManager apiManager = ApiManager();
    var responce = await apiManager.postData(endPoint: EndPoints.login, body: {
      "email": email,
      "password": password,
    });

    UserModel userModel =UserModel.fromJson(responce.data);
    return userModel;
  }
}
