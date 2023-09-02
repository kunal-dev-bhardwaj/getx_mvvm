import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:getx_mvvm/res/color/app_color.dart';
import 'package:get/get.dart';

class Utils {
  static changeFocus(BuildContext context, FocusNode current, FocusNode next) {
    current.unfocus();
    FocusScope.of(context).requestFocus(next);
  }

  static toastMessage(String message, ToastGravity gravity) {
    Fluttertoast.showToast(msg: message, backgroundColor: AppColor.blackColor,
    gravity: gravity
    );
  }

  static checkEmail(String email) {
    if (email.isEmpty || email==null) {
      toastMessage('please enter email address',ToastGravity.CENTER);
    }
    else if(email!=
        RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')){
      toastMessage('check your email',ToastGravity.CENTER);
    }

  }
  static snackBar(String title,String message){
    Get.snackbar(title, message);
  }
}
