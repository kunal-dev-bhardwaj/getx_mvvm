
import 'dart:async';
import 'package:get/get.dart';
import 'package:getx_mvvm/res/routes/routes_name.dart';
import 'package:getx_mvvm/view_model/user_preference/UserPreference.dart';

class SplashServices{
  UserPreference preference=UserPreference();

  isLogin(){
    preference.getUser().then((value) {//then mai vo value ayegi jo ye future fucntion return kr rha hoga
      print(value.token.toString());
      if(value.token.toString()==null || value.token.toString().isEmpty || value.token.toString()=="null" ){
        Timer(Duration(seconds: 3),
                ()=> Get.offNamed(RoutesName.loginView));
      }else{
        Timer(Duration(seconds: 3),
                ()=> Get.offNamed(RoutesName.homeView));
      }




    });



    
  }

}