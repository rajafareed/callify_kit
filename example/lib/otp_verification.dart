import 'package:example/SuccessScreen.dart';
import 'package:example/controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pin_code_fields/flutter_pin_code_fields.dart';
import 'package:get/get.dart';

class OtpVerification extends StatelessWidget {

  var param;
  OtpVerification({@required this.param});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(builder: (app)=>Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: Colors.yellow,
        centerTitle: true,
        title: const Text('Callify',style: TextStyle(color: Colors.black),),

      ),
      body: ListView(
        padding: EdgeInsets.all(15.0),
        children: [
          const SizedBox(height: 20,),
           Center(child:param.toString().length == 4 ? Text('Please enter OTP code',style: TextStyle(
             color: Colors.black,fontSize: Get.height * 0.018
           ),) : Text('Please enter last 4 digit of miss call number',style: TextStyle(
               color: Colors.black,fontSize: Get.height * 0.018
           ))),
        SizedBox(height: 15,),
        param.toString().length == 4 ? PinCodeFields(
          textStyle: TextStyle(fontSize: Get.height * 0.035),
          animation: Animations.rotateRight,
          animationDuration: const Duration(milliseconds: 250),
          animationCurve: Curves.bounceInOut,
          switchInAnimationCurve: Curves.bounceIn,
          switchOutAnimationCurve: Curves.bounceOut,
          activeBorderColor: Colors.yellow,
          fieldWidth: 5,
          onComplete: (String value) { app.otpCodeCheck(value); },
        ) :
       Row(children: [
         Expanded(
           child:Text(param.toString().substring(0,param.toString().length - 3),style: TextStyle(fontSize: Get.height * 0.04,
           letterSpacing: 5),)),
         Container(
           width: Get.width * 0.6,child:PinCodeFields(
           textStyle: TextStyle(fontSize: Get.height * 0.035),
           animation: Animations.rotateRight,
           animationDuration: const Duration(milliseconds: 250),
           animationCurve: Curves.bounceInOut,
           switchInAnimationCurve: Curves.bounceIn,
           switchOutAnimationCurve: Curves.bounceOut,
           activeBorderColor: Colors.yellow,
           fieldWidth: 5,
           onComplete: (String value) {
             app.mobileNumberCheck(value);

           },
         ))
       ],),
          const SizedBox(height: 20,),


        Container(

            height: MediaQuery.of(context).size.height * 0.07,


            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(MediaQuery.of(context).size.height),
                color: Colors.yellow
            ),
            child: InkWell(
              //
              // onTap: callBack,
              onTap: (){
                if(param.toString().length == 4){
                  if(app.userOTP == param.toString()){
                    Get.to(()=>const SuccessScreen());
                  }
                  else{
                    Get.snackbar('OTP', 'Invalid OTP Code');
                  }
                }
                else{
                  if(app.userOTP == param.toString().substring(param.toString().length-4)){
                    Get.to(()=>SuccessScreen());
                  }
                  else{

                    Get.snackbar('OTP', 'Number Not Matched');

                  }
                }
              },

              child: Center(child:Text('Verify OTP',style: TextStyle(letterSpacing: 2,color: Colors.black,fontSize:MediaQuery.of(context).size.height * 0.02,fontWeight: FontWeight.w500),)),
            ))
      ],),
    ));
  }
}
