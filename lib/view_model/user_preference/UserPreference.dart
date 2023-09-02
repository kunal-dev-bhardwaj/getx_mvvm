import 'package:get/get.dart';
import 'package:getx_mvvm/model/login/login_response_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPreference extends GetxController { //save taken from api to shared preference
  Future<bool> saveUser(LoginResponseModel model) async  {
    SharedPreferences sp= await SharedPreferences.getInstance();
    sp.setString('token', model!.token!.toString());
    return true;
  }

  Future<LoginResponseModel> getUser() async  { //to get token
    SharedPreferences sp= await SharedPreferences.getInstance();
    String? token=sp.getString('token');

    return LoginResponseModel(
      token:token
    );
  }
  Future<bool> removeUser() async{
    SharedPreferences sp= await SharedPreferences.getInstance();
    sp.clear();
    return true;


  }

}
