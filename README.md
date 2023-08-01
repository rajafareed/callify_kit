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

Call OTP Verification Package. Simple and easiest way to verify your users through miss call api. You are required to put apiKey,campaingId and userNumber in order to use this package.

## Features

Miss Call OTP Verification.

## Getting started

First, add `callify_kit` as a dependency in your pubspec.yaml file.
```yaml
dependencies:
  callify_kit: ^0.0.3
```

Don't forget to `flutter pub get`.

Then add permission in AndroidManifest.xml
```xml
    <uses-permission android:name="android.permission.READ_CALL_LOG" />
```

## Usage

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

For Voice OTP - Call The  ```callOtpVerification```  Method and pass parameters
- ApiKey
- CampaingID
- Phone Number



```dart
await CallifyService().callOtpVerification(apiKey, campaingID, phoneNumber,
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
