import 'package:appliction_ec/core/utils/constants.dart';
import 'package:dio/dio.dart';

class ApiManager{
  late Dio dio;
  ApiManager(){
    dio=Dio();
  }
  Future<Response> getData({required String endPoint,Map<String,dynamic>? queryParam}){
   return dio.get(Constants.baseUrl+ endPoint ,queryParameters: queryParam);
  }
  Future<Response> postData({required String endPoint,Map<String,dynamic>? body}){
    return dio.post(Constants.baseUrl+ endPoint , data: body);
  }
}