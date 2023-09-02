

import 'package:getx_mvvm/data/network/network_api_services.dart';
import 'package:getx_mvvm/res/app_url/app_url.dart';

class LoginRepository{
  NetworkApiServices apiServices=NetworkApiServices();

   Future<dynamic> loginApi(var data) async{
     dynamic response=apiServices.postApi(data, AppUrl.loginUrl);
     return response;

   }
}