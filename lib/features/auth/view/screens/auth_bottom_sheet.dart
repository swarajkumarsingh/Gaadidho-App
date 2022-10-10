// ignore_for_file: unused_local_variable, no_leading_underscores_for_local_identifiers, unused_element, use_build_context_synchronously, prefer_final_fields, unused_field, camel_case_types, prefer_function_declarations_over_variables, avoid_print, deprecated_member_use, non_constant_identifier_names
import 'package:flutter/material.dart';
import 'package:gaadidho/common/constants/constants.dart';
import 'package:gaadidho/common/constants/utils.dart';
import 'package:gaadidho/common/widgets/custom_buttom.dart';
import 'package:gaadidho/features/auth/controller/auth_controller.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class BottomModelWidget extends StatefulWidget {
  const BottomModelWidget({Key? key}) : super(key: key);

  @override
  State<BottomModelWidget> createState() => _BottomModelWidgetState();
}

// ignore: constant_identifier_names
enum SCREEN_STATE { PHONE_STATE, OTP_STATE }

class _BottomModelWidgetState extends State<BottomModelWidget> {
  // Auth Variables
  final number = TextEditingController();
  final enteredOtp = TextEditingController();

  // Screen State ENUM
  var currentState = SCREEN_STATE.PHONE_STATE;

  // Form Keys
  final formKeyNumber = GlobalKey<FormState>();
  final formKeyOTP = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    number.dispose();
    enteredOtp.dispose();
  }

  @override
  Widget build(BuildContext context) {
    void gaadidhoPrivacyLink() async {
      try {
        String link = "https://gaadidho.com/privacy-policy";
        await launch(link);
      } catch (e) {
        showSnackBar(context, "Could not open the map, Please try again later");
      }
    }

    void gaadidhoTosLink() async {
      try {
        String link = "https://gaadidho.com/tos";
        await launch(link);
      } catch (e) {
        showSnackBar(context, "Could not open the map, Please try again later");
      }
    }

    //  Controller
    final AuthController pcontroller = Get.put(AuthController());

    String verificationId;

    return currentState == SCREEN_STATE.PHONE_STATE
        ? SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            reverse: true,
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      Text(
                        "Login / Create Account",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                      Text("Create account with phone number to proceed"),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text(
                        "10 digits mobile / whatsapp number",
                        textAlign: TextAlign.start,
                        style: TextStyle(fontSize: 9),
                      ),
                      const SizedBox(height: 5),
                      // CustomTextField(
                      //   controller: number,
                      //   text: "+91",
                      //   textInputType: TextInputType.number,
                      // ),
                      Form(
                        key: formKeyNumber,
                        child: TextFormField(
                          validator: (value) {
                            if (value!.isNotEmpty && value.length == 10) {
                              return null;
                            } else if (value.isEmpty) {
                              return "Please Enter a Number";
                            } else if (int.tryParse(value)! < 10) {
                              return "Please Enter 10 digits Number";
                            } else if (int.tryParse(value)! > 10) {
                              return "Please Enter 10 digits NUmber";
                            } else {
                              return "Please Enter a valid Number";
                            }
                          },
                          controller: number,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "+91",
                            fillColor: GlobalVariables.textFieldColor,
                            filled: true,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomButton(
                        onPressed: () async {
                          if (!formKeyNumber.currentState!.validate()) {
                            return;
                          }

                          // _verifyPhoneNumber();
                          await pcontroller.verifyPhoneNumber(
                            number: number.text,
                          );
                          setState(() {
                            currentState = SCREEN_STATE.OTP_STATE;
                          });
                        },
                        text: "Enter your Phone ",
                      ),
                      const SizedBox(height: 25),
                      Center(
                        child: RichText(
                          text: const TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                text: 'By continuing, I accept the ',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 10,
                                  color: Colors.black,
                                ),
                              ),
                              TextSpan(
                                text: 'Terms of use ',
                                style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: 10,
                                ),
                              ),
                              TextSpan(
                                text: '& ',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 10,
                                  color: Colors.black,
                                ),
                              ),
                              TextSpan(
                                text: 'Privacy Notice',
                                style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 10,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom,
                    ),
                  ),
                ],
              ),
            ),
          )
        : SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            reverse: true,
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      Text(
                        "Enter Verification OTP",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                      Text("Enter OTP to proceed and create an account."),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Text(
                        "6 digits OTP",
                        textAlign: TextAlign.start,
                        style: TextStyle(fontSize: 9),
                      ),
                      const SizedBox(height: 5),
                      Form(
                        key: formKeyOTP,
                        child: TextFormField(
                          validator: (value) {
                            if (value!.isNotEmpty && value.length == 6) {
                              return null;
                            } else if (value.isEmpty) {
                              return "Please Enter the OTP";
                            } else if (int.tryParse(value)! < 6) {
                              return "Please Enter 6 digits OTP";
                            } else if (int.tryParse(value)! > 6) {
                              return "Please Enter 6 digits OTP";
                            } else {
                              return "Please Enter a valid OTP";
                            }
                          },
                          controller: enteredOtp,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Enter the OTP",
                            fillColor: GlobalVariables.textFieldColor,
                            filled: true,
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      InkWell(
                          onTap: () async {
                            await pcontroller.verifyPhoneNumber(
                              number: number.text,
                            );
                          },
                          child: const Text("Resend OTP"))
                    ],
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomButton(
                        onPressed: () async {
                          if (!formKeyOTP.currentState!.validate()) {
                            return;
                          }
                          await pcontroller.verifyOtp(enteredOtp.text, context);
                          pcontroller.statusCode_result == "200"
                              ? setState(() {
                                  isLoggedIn = true;
                                })
                              : setState(() {
                                  isLoggedIn = true;
                                });
                        },
                        text: "Enter your OTP",
                      ),
                      const SizedBox(height: 25),
                      Center(
                        child: RichText(
                          text: const TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                text: 'By continuing, I accept the ',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 10,
                                  color: Colors.black,
                                ),
                              ),
                              TextSpan(
                                text: 'Terms of use ',
                                style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: 10,
                                ),
                              ),
                              TextSpan(
                                text: '& ',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 10,
                                  color: Colors.black,
                                ),
                              ),
                              TextSpan(
                                text: 'Privacy Notice',
                                style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 10,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom,
                    ),
                  ),
                  Obx(() {
                    return pcontroller.isLoading_result
                        ? const SizedBox(
                            height: 100,
                            width: 100,
                            child: Center(
                              child: CircularProgressIndicator(),
                            ),
                          )
                        : Container();
                  }),
                ],
              ),
            ),
          );
  }
}
