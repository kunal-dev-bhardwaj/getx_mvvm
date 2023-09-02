import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm/res/color/app_color.dart';
import 'package:getx_mvvm/res/components/round_button.dart';
import 'package:getx_mvvm/utils/utils.dart';
import 'package:getx_mvvm/view_model/controller/login/login_view_model.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final controller = Get.put(LoginViewModel());
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('login'.tr),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Form(
                key: formKey,
                child: Column(
                  children: [
                    TextFormField(
                        controller: controller.emailController.value,
                        focusNode: controller.emailFocusNode.value,
                        validator: (value) {
                          if (value!.isEmpty) {
                            Utils.snackBar('Email', 'Enter Email');
                          }
                        },
                        onFieldSubmitted: (value) {
                          Utils.changeFocus(
                              context, controller.emailFocusNode.value,
                              controller.passwordFocusNode.value);
                        },
                        decoration: InputDecoration(
                            hintText: 'email_hint'.tr,
                            border: OutlineInputBorder()
                        )
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                        controller: controller.passwordController.value,
                        focusNode: controller.passwordFocusNode.value,
                        validator: (value) {
                          if (value!.isEmpty) {
                            Utils.snackBar('Password', 'Enter password');
                          }
                        },
                        decoration: InputDecoration(
                            hintText: 'password_hint'.tr,
                            border: OutlineInputBorder()
                        )
                    ),
                  ],

                )
            ),

            SizedBox(height: 20,),
            Obx(() {
              return RoundButton(title: 'login'.tr,
                width: 160,
                loading: controller.isLoading.value,
                textColor: AppColor.whiteColor,
                onPress: () {
                  if (formKey.currentState!.validate()) {
                    controller.loginApi();
                  }
                },);
            })


          ],

        ),
      ),
    );
  }
}