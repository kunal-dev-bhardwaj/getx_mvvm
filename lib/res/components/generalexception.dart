import 'package:flutter/material.dart';
import 'package:getx_mvvm/res/color/app_color.dart';
import 'package:get/get.dart';
class GeneralExceptionWidget extends StatefulWidget {
  final VoidCallback onpress;

  const GeneralExceptionWidget({Key? key, required this.onpress})
      : super(key: key);

  @override
  State<GeneralExceptionWidget> createState() =>
      _GeneralExceptionWidgetState();
}

class _GeneralExceptionWidgetState extends State<GeneralExceptionWidget> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          SizedBox(height: height*.15,),
          Icon(Icons.cloud_off,color: AppColor.redColor,),
          SizedBox(height: height*.15,),
          Padding(padding: EdgeInsets.only(top: 40),
              child: Center(
                child: Text('internet_exception'.tr,textAlign: TextAlign.center,),
              )
          ),
          InkWell(
            onTap: widget.onpress,
            child: Container(
              height: 44,
              width: 160,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColor.pinkColor
              ),
              child: Center(
                child: Text('retry.'.tr),
              ),
            ),
          )
        ],
      ),
    );
  }
}
