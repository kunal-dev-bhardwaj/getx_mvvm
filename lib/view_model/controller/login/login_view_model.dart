import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm/model/login/login_response_model.dart';
import 'package:getx_mvvm/repository/login_repository/login_repository.dart';
import 'package:getx_mvvm/res/routes/routes_name.dart';
import 'package:getx_mvvm/utils/utils.dart';
import 'package:getx_mvvm/view_model/user_preference/UserPreference.dart';

class LoginViewModel extends GetxController {
  final api = LoginRepository();
  UserPreference preference=UserPreference();


  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;
  final emailFocusNode = FocusNode().obs;
  final passwordFocusNode = FocusNode().obs;
  RxBool isLoading=false.obs;

  void loginApi() {
    isLoading.value=true;
    Map data={
      "email": emailController.value.text ,
      "password": passwordController.value.text
    };
    api.loginApi(data).then((value){
      if(kDebugMode){
        print('value:$value');
      }
      isLoading.value=false;
      if(value['error']=='user not found'){
        Utils.snackBar('Login',value['error']);
      }else{
        preference.saveUser(LoginResponseModel.fromJson(value)).then((value) {
          Get.toNamed(RoutesName.homeView);
        }).onError((error, stackTrace) {
         
        });
        Utils.snackBar('Login','login sucessfully');
      }

    }).onError((error, stackTrace){
      print(error.toString());
      isLoading.value=false;
      Utils.snackBar('error', error.toString());
    });
  }


}