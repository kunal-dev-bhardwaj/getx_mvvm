import 'package:flutter/material.dart';
import 'package:getx_mvvm/res/color/app_color.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm/res/components/round_button.dart';
class InternetExceptionWidget extends StatefulWidget {
  final VoidCallback onpress;


  const InternetExceptionWidget({Key? key, required this.onpress})
      : super(key: key);

  @override
  State<InternetExceptionWidget> createState() =>
      _InternetExceptionWidgetState();
}

class _InternetExceptionWidgetState extends State<InternetExceptionWidget> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          SizedBox(height: height*.100),
          Icon(Icons.cloud_off,color: AppColor.redColor,size: 50,),

          Padding(padding: EdgeInsets.only(top: 20),
          child: Center(
            child: Text('internet_exception'.tr,textAlign: TextAlign.center,),
          ),
          ),
          SizedBox(height: height*.15,),
          InkWell(
            onTap: widget.onpress,
            child: Container(
              height: 44,
                width: 160,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: AppColor.pinkColor
              ),
              child: Center(
                child: Text('retry'.tr,style: TextStyle(color: AppColor.whiteColor),),
              ),
            ),
          ),

        ],
      ),
    );
  }
}
