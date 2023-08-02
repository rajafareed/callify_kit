library callify_kit;

import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:http/http.dart' as http;
import 'package:phone_state/phone_state.dart';

enum Responses { success, failed, permissionError }

class CallifyService {
  var isRunning = false;
  var isVerified = false;
  dynamic callReceivedCallBack;

  static final _random = Random();
  static const maxNumericDigits = 17;

  static int getInteger(int digitCount) {
    if (digitCount > maxNumericDigits || digitCount < 1) {
      throw RangeError.range(0, 1, maxNumericDigits, "Digit Count");
    }
    var digit = _random.nextInt(9) + 1;
    int n = digit;

    for (var i = 0; i < digitCount - 1; i++) {
      digit = _random.nextInt(10);
      n *= 10;
      n += digit;
    }
    return n;
  }

  Future missCallVerification(
      {@required apiKey,
      @required campaingID,
      @required userNumber,
      callReceivedCallBack}) async {
    await [
      Permission.phone,
    ].request();
    var response = await http.get(Uri.parse(
        'https://api.smsits.com/misscall?Apikey=$apiKey&recipient=$userNumber&campid=$campaingID&uniqueId=123456'));

    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      if (Platform.isAndroid) {
        callReceivedCallBack(
            check(jsonResponse['Sender'], callReceivedCallBack));
      } else {
        callReceivedCallBack(jsonResponse['Sender']);
      }
    } else {
      callReceivedCallBack(Responses.failed);
    }


  }


  Future callifyVerification(
      {@required apiKey,
        @required campaingID,
        @required userNumber,
        callReceivedCallBack}) async {

    var response = await http.get(Uri.parse(
        'https://api.smsits.com/misscall?Apikey=$apiKey&recipient=$userNumber&campid=$campaingID&uniqueId=123456'));
    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);

      callReceivedCallBack(jsonResponse['Sender']);

    } else {
      callReceivedCallBack(Responses.failed);
    }
  }


  voiceOtpVerification(
      {@required apiKey,
      @required campaingID,
      @required userNumber,
      callReceivedCallBack}) async {
    var otp = getInteger(4);
    var response = await http.get(Uri.parse(
        'https://api.smsits.com/misscall?Apikey=$apiKey&recipient=$userNumber&campid=$campaingID&uniqueId=123456&param1=$otp'));
    if (response.statusCode == 200) {
      callReceivedCallBack(otp);
    } else {
      callReceivedCallBack(Responses.failed);
    }
  }

  smsOtpVerification(
      {@required userName,
        @required password,
        @required originator,
        @required userNumber,
        callReceivedCallBack}) async {

    var otp = getInteger(4);

    var phone = userNumber.toString().substring(1,userNumber.toString().length);
    var response = await http.get(Uri.parse(
        'https://api.smsits.com/Gotp?action=sendmessage&username=$userName&&password=$password&recipient=92$phone&originator=$originator&otpcode=$otp&otptype=1'));
    if (response.statusCode == 200) {
      callReceivedCallBack(otp);
    } else {
      callReceivedCallBack(Responses.failed);
    }
  }

  whatsappOtpVerification(
      {@required apiKey,
        @required templateId,
        @required userNumber,
        callReceivedCallBack}) async {
    var phone = userNumber.toString().substring(1,userNumber.toString().length);

    var otp = getInteger(4);
    var response = await http.get(Uri.parse(
        'https://otac.golive.com.pk/api/whatsapp/otp?apikey=$apiKey&recipient=+92$phone&templateId=$templateId&otac=$otp'));
    if (response.statusCode == 200) {
      var js = json.decode(response.body);
      if(js['response']['status'] == 'success'){
        callReceivedCallBack(otp);
      }
      else{
        callReceivedCallBack(Responses.failed);

      }
    } else {
      callReceivedCallBack(Responses.failed);
    }
  }

  Future<StreamSubscription<PhoneState>> check(number, callBack) async {
    return PhoneState.stream.listen((event) {
      var minus = number.toString().length;

      if (number == event.number?.substring(event.number!.length - minus) &&
          event.status == PhoneStateStatus.CALL_ENDED) {
        callBack(Responses.success);
      }
    });
  }
}
