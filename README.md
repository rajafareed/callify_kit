<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages).
-->

## Getting Started

Callify OTP Verification Package. Simple and easiest way to verify your users through Miss Call, Voice OTP, SMS OTP and WhatsApp OTP.

## Features

Miss Call OTP Verification.

## Getting started

First, add `callify_kit` as a dependency in your pubspec.yaml file.
```yaml
dependencies:
  callify_kit: ^0.0.4
```

Don't forget to `flutter pub get`.

Then add permission in AndroidManifest.xml
```xml
    <uses-permission android:name="android.permission.READ_CALL_LOG" />
```

## Usage

For Callify OTP - Call The  ```callifyVerification```  Method and pass parameters
- ApiKey
- CampaingID
- Phone Number



```dart
await CallifyService().callifyVerification(apiKey, campaingID, phoneNumber,
callReceivedCallBack: (response){
// in response you will get incoming call number, just need to verify it
});
```

For Miss Call OTP - Call The  ```missCallVerification```  Method and pass parameters
- ApiKey
- CampaingID
- Phone Number



```dart
await CallifyService().missCallVerification(apiKey, campaingID, phoneNumber,
callReceivedCallBack: (response){
// If you are using this package in iOS then you will get incoming call number in response and in Android this package will detect the incoming call and validate it with response number
});
```

For Voice OTP - Call The  ```voiceOtpVerification```  Method and pass parameters
- ApiKey
- CampaingID
- Phone Number



```dart
await CallifyService().voiceOtpVerification(apiKey, campaingID, phoneNumber,
callReceivedCallBack: (response){
// in response you get OTP or Failed
});
```

For SMS OTP - Call The  ```smsOtpVerification```  Method and pass parameters
- User Name
- Password
- Originator
- Phone Number




```dart
await CallifyService().smsOtpVerification(userName, password, originator, phoneNumber,
callReceivedCallBack: (response){
// in response you get OTP or Failed
});
```

For WhatsApp OTP - Call The  ```whatsappOtpVerification```  Method and pass parameters
- ApiKey
- Template ID
- Phone Number




```dart
await CallifyService().whatsappOtpVerification(apiKey, templateId, phoneNumber,
callReceivedCallBack: (response){
// in response you get OTP or Failed 
});
```
