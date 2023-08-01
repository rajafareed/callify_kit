import 'dart:async';

import 'package:call_log/call_log.dart';
import 'package:callify_kit/callify_kit.dart';
import 'package:example/SuccessScreen.dart';
import 'package:example/otp_selection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

void main() {
  runApp( GetMaterialApp(
    theme: ThemeData(
        appBarTheme: const AppBarTheme(
            iconTheme: IconThemeData(
                color: Colors.black
            )
        )
    ),
    debugShowCheckedModeBanner: false,
    home: const OtpSelection(),

  ));
}

