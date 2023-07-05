library callify_kit;

import 'dart:async';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:http/http.dart' as http;
import 'package:phone_state/phone_state.dart';


class CallifyService {

  var isRunning = false;
  var isVerified = false;
  var callReceivedCallBack;


  Future<String?> missCallVerification(@required var apiKey,
      @required var campaingID,
      @required userNumber, var delaySeconds,{callReceivedCallBack}) async {
    Map<Permission, PermissionStatus> permissionStatus = await [

      Permission.phone,
    ].request();
    if (permissionStatus[Permission.phone]!.isGranted) {
      print(
          'https://api.smsits.com/misscall?Apikey=$apiKey&recipient=$userNumber&campid=$campaingID&uniqueId=123456');
      var response = await http.get(Uri.parse(
          'https://api.smsits.com/misscall?Apikey=$apiKey&recipient=$userNumber&campid=$campaingID&uniqueId=123456'));
      print(response.statusCode);
      if (response.statusCode == 200) {
        print(response.body);
        var jsonResonse = json.decode(response.body);
        callReceivedCallBack(check(jsonResonse['Sender'],callReceivedCallBack));
      }

    }
  }





  Future<StreamSubscription<PhoneState>> check(number,callBack) async {
    return  PhoneState.stream.listen((event) {
      if (number == event.number?.substring(3, event.number?.length) && event.status == PhoneStateStatus.CALL_ENDED) {
        callBack(true);
      }
    });
  }


}

