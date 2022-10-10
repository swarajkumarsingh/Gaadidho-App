// ignore_for_file: non_constant_identifier_names, prefer_function_declarations_over_variables, use_build_context_synchronously, unused_local_variable, unnecessary_null_comparison, invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member

import 'dart:convert';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gaadidho/common/constants/constants.dart';
import 'package:gaadidho/common/constants/utils.dart';
import 'package:gaadidho/common/widgets/bottom_bar.dart';
import 'package:gaadidho/features/bike_registration/view/screens/register_starter.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class AuthController extends GetxController {
  final FirebaseAuth auth = FirebaseAuth.instance;

  var userToken = "".obs;
  var statusCode = "".obs;
  var userData = "".obs;
  var userTokenFirebase = "".obs;
  var userInfo = "".obs;
  var vf = "".obs;
  var status_string = "welcome".obs;
  var code_sent = false.obs;
  var verification_id = "".obs;
  var isLoading = false.obs;

  String get result => status_string.value;
  String get userTokenFirebase_result => userTokenFirebase.value;
  String get userData_result => userData.value;
  String get statusCode_result => statusCode.value;
  String get userToken_result => userToken.value;
  String get userInfo_result => userInfo.value;
  String get verification_id_result => verification_id.value;
  bool get code_sent_result => isLoading.value;
  bool get isLoading_result => isLoading.value;

  verifyPhoneNumber({
    required String number,
  }) async {
    final PhoneVerificationFailed verificationFailed =
        (FirebaseAuthException authException) {
      Utility.showToast(msg: authException.message.toString());
    };

    final PhoneCodeSent codeSent =
        (String verificationId, [int? forceResendingToken]) async {
      code_sent.value = true;
      Utility.showToast(
        msg: "Please check your phone for the verification code.",
      );
      verification_id.value = verificationId;
    };

    final PhoneCodeAutoRetrievalTimeout codeAutoRetrievalTimeout =
        (String verificationId) {
      verification_id.value = verificationId;
    };

    PhoneVerificationCompleted verificationCompleted =
        (PhoneAuthCredential phoneAuthCredential) async {};

    await auth
        .verifyPhoneNumber(
          phoneNumber: "+91$number",
          timeout: const Duration(seconds: 5),
          verificationCompleted: verificationCompleted,
          verificationFailed: verificationFailed,
          codeSent: codeSent,
          codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
        )
        .then((value) {})
        .catchError((onError) {
      Utility.showToast(msg: "Something went wrong, Try again later.");
    });
  }

  signInWithPhoneNumber(
      {required String otp, required BuildContext context}) async {
    if (await Utility.checkInternet()) {
      isLoading.value = true;

      try {
        final AuthCredential credential = PhoneAuthProvider.credential(
          verificationId: verification_id.toString(),
          smsCode: otp,
        );
        final User? user = (await auth.signInWithCredential(credential)).user;

        if (user != null) {
          userTokenFirebase.value = await user.getIdToken(false);

          final User? currentUser = auth.currentUser;

          if (currentUser != null) {
            assert(user.uid == currentUser.uid);
          }

          // Navigator.pushReplacementNamed(
          //   context,
          //   BikeRegisterStarter.routeName,
          //   arguments: user,
          // );

          DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
          AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;

          final AndroidDeviceName = androidInfo.model;
          final AndroidDeviceId = androidInfo.androidId;
          var IosDeviceName = "";
          var IosDeviceId = "";

          if (Platform.isIOS) {
            IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
            IosDeviceName = "${iosInfo.name} ${iosInfo.model}";
            IosDeviceId = "${iosInfo.name} ${iosInfo.model}";
          }

          // Sending request to the backend (firebase token)
          void loginUser() async {
            try {
              var body = {
                "phoneNumber": user.phoneNumber,
                "payload": userTokenFirebase_result,
                "signature": "",
                "signingAlgorithm": "",
                "method": "phone_verification",
                // "deviceId": Platform.isAndroid ? AndroidDeviceId : IosDeviceId,
                "deviceId": "9fea65928d905e1465",
                "deviceName":
                    Platform.isAndroid ? AndroidDeviceName : IosDeviceName,
                "referredBy": "organic"
              };

              http.Response response = await http.post(
                Uri.parse("$uri/auth/login/bike-dho"),
                body: body,
              );
              if (response.statusCode == 200) {
                statusCode.value = "200";
                var data = jsonDecode(response.body);
                final box = GetStorage();
                userData.value = response.body;
                box.write(
                  'x-auth-token',
                  data["data"]["token"],
                );

                Utility.showToast(msg: "Logged in SuccessFully");

                Navigator.pushNamed(
                  context,
                  BottomBar.routeName,
                );
              } else {
                Utility.showToast(
                  msg: "SomeThing went wrong, Try again later.",
                );
              }
            } catch (e) {
              // Later will do something
            }
          }

          // Calling the login function
          loginUser();
        }
      } catch (e) {
        isLoading.value = false;
        Utility.showToast(msg: e.toString());
      }
    } else {
      isLoading.value = false;
      Utility.showToast(msg: "No internet connection");
    }
  }

  verifyOtp(String otpText, BuildContext context) async {
    signInWithPhoneNumber(otp: otpText, context: context);
  }
}
