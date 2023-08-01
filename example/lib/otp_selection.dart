import 'package:example/enums.dart';
import 'package:example/phone_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OtpSelection extends StatelessWidget {
  const OtpSelection({super.key});



  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.yellow,
        centerTitle: true,
        title: const Text('Callify',style: TextStyle(color: Colors.black),),
      ),
      body: SafeArea(child: Column(

          children: [
            SizedBox(height: Get.height * 0.2,
            child: Center(child:
            Text('Verification Services',style: TextStyle(decoration: TextDecoration.underline,color: Colors.black,fontSize: Get.height * 0.028,fontWeight: FontWeight.w700),),),),
            Expanded(child: Container(
              width: Get.width,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(40),topRight: Radius.circular(40)),
                color: Colors.yellow
              ),
              child: Column(

                children: [
                  const SizedBox(height: 50,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                    children: [
                      InkWell(
                        onTap:(){
                          Get.to(()=>PhoneScreen(),arguments: [VerificationType.missCall]);
                        },
                        child:Container(
                        height: Get.height * 0.16,
                        width: Get.width * 0.35,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(color: Colors.black,width: 2)
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset('assets/misscall.png',height: 60,width: 60,),
                            const SizedBox(height: 10,),
                            Text('Miss Call',style: TextStyle(fontSize: Get.height * 0.018),)
                          ],),
                      )),
                      InkWell(
                        onTap:(){
                          Get.to(()=>PhoneScreen(),arguments: [VerificationType.call]);
                        },
                        child:Container(
                        height: Get.height * 0.16,
                        width: Get.width * 0.35,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(color: Colors.black,width: 2)
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset('assets/call.png',height: 60,width: 60,),
                            const SizedBox(height: 10,),
                            Text('Call OTP',style: TextStyle(fontSize: Get.height * 0.018))
                          ],),
                      )),
                    ],),
                  const SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                    children: [
                      InkWell(
                        onTap:(){
                          Get.to(()=>PhoneScreen(),arguments: [VerificationType.sms]);
                      },
                        child: Container(
                        height: Get.height * 0.16,
                        width: Get.width * 0.35,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(color: Colors.black,width: 2)
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset('assets/sms.png',height: 60,width: 60,),
                            const SizedBox(height: 10,),
                            Text('SMS OTP',style: TextStyle(fontSize: Get.height * 0.018))
                          ],),
                      ),),
                      InkWell(
                        onTap:(){
                          Get.to(()=>PhoneScreen(),arguments: [VerificationType.whatsapp]);
                        },
                        child:Container(
                        height: Get.height * 0.16,
                        width: Get.width * 0.35,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(color: Colors.black,width: 2)
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset('assets/whatsapp.png',height: 60,width: 60,),
                            const SizedBox(height: 10,),
                            Text('Whatsapp OTP',style: TextStyle(fontSize: Get.height * 0.018))
                          ],),
                      )),
                    ],),
                ],),
            ))])),
    );
  }
}
