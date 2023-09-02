import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm/res/color/app_color.dart';

class RoundButton extends StatelessWidget {
  const RoundButton(
      {Key? key,
      this.height = 50,
      this.width = 60,
      this.buttonColor = AppColor.pinkColor,
      this.textColor = AppColor.whiteColor,
      required this.onPress,
      this.loading = false,
      required this.title})
      : super(key: key);

  final bool loading;
  final String title;
  final Color buttonColor, textColor;
  final VoidCallback onPress;
  final double height, width;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress ,
      child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
              color: buttonColor, borderRadius: BorderRadius.circular(50)),
                child: loading
              ? Center(child: CircularProgressIndicator())
              : Center(
                  child: Text(title,style: TextStyle(color: textColor),),
                )),
    );
  }
}
