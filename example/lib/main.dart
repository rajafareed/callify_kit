import 'dart:async';

import 'package:call_log/call_log.dart';
import 'package:callify_kit/callify_kit.dart';
import 'package:example/SuccessScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',

      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Callify'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  var isLoad = false;
  TextEditingController numberController = TextEditingController();
  void incrementCounter() async{
    FocusManager.instance.primaryFocus?.unfocus();

    setState(() {
        isLoad = true;
      });
      await CallifyService().missCallVerification('19753A043CF92207609BCB79DDECA8D4', '323', numberController.text.toString(),
          callReceivedCallBack: (response){

        // return true if user get the call

          });


    // print(response);
    //   if(response == true){
    //     setState(() {
    //       isLoad = false;
    //       numberController.text = '';
    //     });
    //     Get.to(()=>SuccessScreen());
    //   }


  }
  final spinkit =
  SpinKitFoldingCube(itemBuilder: (BuildContext context, int index) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: index.isEven ? Colors.yellow : Colors.black12,
      ),
    );
  });
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Colors.yellow,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: ListView(

        padding: EdgeInsets.all(15.0),
          children: <Widget>[
            SizedBox(height: 20,),
            TextField(
              controller: numberController,
          keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(20),
                  labelText: 'Enter Your Mobile Number',
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
           isLoad ? spinkit : Container(

                height: MediaQuery.of(context).size.height * 0.07,


                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(MediaQuery.of(context).size.height),
                    color: Colors.yellow
                ),
                child: InkWell(
                  //
                  // onTap: callBack,
                  onTap: (){
                    if(numberController.text.trim().isEmpty){
                      Get.snackbar('Number', 'Please Enter Phone Number');
                    }
                    else if(numberController.text.trim().toString().length !=11){
                      Get.snackbar('Number', 'Please Enter Valid Phone Number');

                    }
                    else {
                      incrementCounter();
                    }
                    },

                  child: Center(child:Text('Verify OTP',style: TextStyle(letterSpacing: 2,color: Colors.white,fontSize:MediaQuery.of(context).size.height * 0.02,fontWeight: FontWeight.w500),)),
                ))
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: const Icon(Icons.add),
      // ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
