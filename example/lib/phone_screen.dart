import 'package:example/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pin_code_fields/flutter_pin_code_fields.dart';
import 'package:get/get.dart';

class PhoneScreen extends StatelessWidget {
  const PhoneScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(
        init: AppController(),
        builder: (app)=>Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        centerTitle: true,
        title: const Text('Callify',style: TextStyle(color: Colors.black),),
      automaticallyImplyLeading: true,),
      body: Center(

        child: ListView(

          padding: EdgeInsets.all(15.0),
          children: <Widget>[
            const SizedBox(height: 20,),


            TextField(
              controller: app.numberController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(20),
                labelText: 'Enter Your Mobile Number',
                labelStyle: TextStyle(color: Colors.black54),
                counterText: '',
                hintText: '',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide:
                  const BorderSide(color: Colors.black, width: 2.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide:
                  const BorderSide(color: Colors.black, width: 2.0),
                ),
              ),

            ),
            SizedBox(height: 20,),
            app.isLoad ? app.spinkit : Container(

                height: MediaQuery.of(context).size.height * 0.07,


                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(MediaQuery.of(context).size.height),
                    color: Colors.yellow
                ),
                child: InkWell(
                  //
                  // onTap: callBack,
                  onTap: (){
                    if(app.numberController.text.trim().isEmpty){
                      Get.snackbar('Number', 'Please Enter Phone Number');
                    }
                    else if(app.numberController.text.trim().toString().length !=11){
                      Get.snackbar('Number', 'Please Enter Valid Phone Number');

                    }
                    else {
                      app.sendRequest(app.numberController.text);
                      // incrementCounter();
                    }
                  },

                  child: Center(child:Text('Send OTP',style: TextStyle(letterSpacing: 2,color: Colors.black,fontSize:MediaQuery.of(context).size.height * 0.02,fontWeight: FontWeight.w500),)),
                ))
          ],
        ),
      ),
    ));
  }
}
