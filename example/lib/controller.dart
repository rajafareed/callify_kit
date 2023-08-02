import 'dart:io';

import 'package:callify_kit/callify_kit.dart';
import 'package:example/SuccessScreen.dart';
import 'package:example/enums.dart';
import 'package:example/otp_verification.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

class AppController extends GetxController{
  TextEditingController numberController = TextEditingController();
  var isLoad  = false;

  var type;
  var otp;
  var missCallNumber;
  var data = Get.arguments;
  var userOTP;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    if(data != null){
      type = data[0];
      update();
    }
  }
  final spinkit =
  SpinKitFoldingCube(itemBuilder: (BuildContext context, int index) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: index.isEven ? Colors.yellow : Colors.black12,
      ),
    );
  });

  sendRequest(number) {
    print(type);
    isLoad = true;
    update();
    if (type == VerificationType.call) {
      CallifyService().voiceOtpVerification(
          apiKey: '', campaingID: '', userNumber: number,
          callReceivedCallBack: (response) {
            print(response);
            otp = response;
            isLoad = false;
            update();
            if(otp.toString().length == 4){
              Get.to(()=>OtpVerification(param: otp,));
            }
          });
    }
    else if(type == VerificationType.missCall){
      CallifyService().missCallVerification(
          apiKey: '', campaingID: '', userNumber: number,
          callReceivedCallBack: (response) async {
            print(response);
            isLoad = false;
            update();

            if(Platform.isIOS){
              missCallNumber = response.toString();
              update();
                Get.to(()=>OtpVerification(param: response.toString()));

            }
            else {
              if(response == Responses.success){
                Get.to(()=>SuccessScreen());
              }
              else{

                Get.snackbar('Verification', 'Verification Failed, Please Try Again');
              }
            }

          });
    }
    else if(type == VerificationType.callify){
      CallifyService().callifyVerification(
          apiKey: '', campaingID: '', userNumber: number,
          callReceivedCallBack: (response) async {
            print(response);
            isLoad = false;
            update();


              missCallNumber = response.toString();
              update();
              Get.to(()=>OtpVerification(param: response.toString()));



          });
    }
    else if(type == VerificationType.sms){
      CallifyService().smsOtpVerification(userName: '', password: '', originator: '', userNumber: number,
      callReceivedCallBack: (response){
        print(response);
        otp = response;
        isLoad = false;
        update();
        if(otp.toString().length == 4){
          Get.to(()=>OtpVerification(param: otp,));
        }
      });
    }
    else if(type == VerificationType.whatsapp){
      CallifyService().whatsappOtpVerification(apiKey: '', templateId: '', userNumber: number,
      callReceivedCallBack: (response){
        print(response);
        otp = response;
        isLoad = false;
        update();
        print(otp);
        if(otp.toString().length == 4){
          Get.to(()=>OtpVerification(param: otp,));
        }
      });
    }
  }

 mobileNumberCheck(code){
  userOTP = code;
  update();
 }
 otpCodeCheck(otp){
    userOTP = otp;
    update();
 }
}