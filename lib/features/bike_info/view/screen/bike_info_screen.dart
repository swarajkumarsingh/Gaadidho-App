// ignore_for_file: deprecated_member_use, invalid_use_of_visible_for_testing_member, avoid_print

import 'package:flutter/material.dart';
import 'package:gaadidho/common/constants/constants.dart';
import 'package:gaadidho/common/constants/utils.dart';
import 'package:gaadidho/common/widgets/custom_divider.dart';
import 'package:gaadidho/features/refer_and_earn/view/screens/refer_and_earn_screen.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class BikeInfoScreen extends StatelessWidget {
  static const String routeName = "/bike-info";

  const BikeInfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);

    void shareApp() async {
      try {
        const urlPreview =
            "https://play.google.com/store/apps/details?id=com.wash.gaadidho";
        await Share.share(
            "GaadiDho is an Instant Bike Washing & Shining Subscription Service. GaadhiDho provides monthly subscription for Bike Wash, We are opening our Bike Washing Points on every 5 km to provide instant bike washing service.Free Download it from Google PlayStore  \n\n$urlPreview");
      } catch (e) {
        showSnackBar(context, "Unable to share, Please try again later.");
      }
    }

    void rateApp() async {
      try {
        String googleMapUrl =
            "https://play.google.com/store/apps/details?id=com.wash.gaadidho";
        await launch(googleMapUrl);
      } catch (e) {
        showSnackBar(context, "Could not open the map, Please try again later");
      }
    }

    void gaadidhoPrivacyLink() async {
      try {
        String googleMapUrl = "https://gaadidho.com/privacy-policy";
        await launch(googleMapUrl);
      } catch (e) {
        showSnackBar(context, "Could not open the map, Please try again later");
      }
    }

    void gaadidhoTosLink() async {
      try {
        String googleMapUrl = "https://gaadidho.com/tos";
        await launch(googleMapUrl);
      } catch (e) {
        showSnackBar(context, "Could not open the map, Please try again later");
      }
    }

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.keyboard_backspace_rounded,
            color: GlobalVariables.backArrowColor,
            size: 35,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Refer and Earn Free Wash",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context)
                        .pushNamed(ReferAndEarnScreen.routeName);
                  },
                  child: Container(
                    padding: const EdgeInsets.only(right: 15),
                    child: Image.network(
                        "https://res.cloudinary.com/swaraj-cloud/image/upload/v1658579412/GaadiDHo/aon2ncwplznwrmapevsz.png"),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(right: 5),
                  child: IconButton(
                    onPressed: shareApp,
                    icon: const Icon(
                      Icons.share,
                      color: Colors.black,
                      size: 28,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Bike Details",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 23,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 12),
              const CustomTextFieldReadOnly(
                  hint: "Bike Number", text: "KA04W8900"),
              const SizedBox(height: 20),
              CustomBikePhotoWidget(mediaQueryData: mediaQueryData),
              const SizedBox(height: 20),
              const CustomTextFieldReadOnly(
                  hint: "Google Map Location", text: "12.8645226,77.5733936"),
              const CustomDrawer(),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: const Text(
                            "Share App",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: rateApp,
                          style: ElevatedButton.styleFrom(
                            primary: Colors.orange,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: const Text(
                            "Rate App",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: double.infinity,
                    height: 43,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.purple,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(context)
                            .pushNamed(ReferAndEarnScreen.routeName);
                      },
                      child: const Text(
                        "Refer and Earn Free Wash",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "A Wearingo Technologies Pvt Ltd Company",
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "App Version:12, App Version Code: 8",
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 20,
                      left: 30,
                      right: 30,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: gaadidhoPrivacyLink,
                          child: const Text(
                            "Privacy Policy",
                            style: TextStyle(
                              color: GlobalVariables.primaryColor,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: gaadidhoTosLink,
                          child: const Text(
                            "Terms of use",
                            style: TextStyle(
                              color: GlobalVariables.primaryColor,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomBikePhotoWidget extends StatelessWidget {
  const CustomBikePhotoWidget({
    Key? key,
    required this.mediaQueryData,
  }) : super(key: key);

  final MediaQueryData mediaQueryData;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Honda Livo",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 12,
              ),
            ),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.only(
                top: 12,
                left: 15,
              ),
              height: 43,
              width: mediaQueryData.size.width / 1.7,
              decoration: BoxDecoration(
                color: GlobalVariables.textFieldColor,
                borderRadius: BorderRadius.circular(6),
              ),
              child: const Text(
                "KA 538RE7",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
        Image.network(
          GlobalVariables.bikeUrl,
          height: 75,
          width: 75,
          fit: BoxFit.fitHeight,
        ),
      ],
    );
  }
}

class DoubleButtonWidget extends StatelessWidget {
  final String text;
  const DoubleButtonWidget({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void shareApp() async {
      try {
        const urlPreview =
            "https://play.google.com/store/apps/details?id=com.wash.gaadidho";
        await Share.share(
            "GaadiDho is an Instant Bike Washing & Shining Subscription Service. GaadhiDho provides monthly subscription for Bike Wash, We are opening our Bike Washing Points on every 5 km to provide instant bike washing service.Free Download it from Google PlayStore  \n\n$urlPreview");
      } catch (e) {
        showSnackBar(context, "Unable to share, Please try again later.");
      }
    }

    return Expanded(
      child: ElevatedButton(
        onPressed: shareApp,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 15,
          ),
        ),
      ),
    );
  }
}

class CustomTextFieldReadOnly extends StatelessWidget {
  const CustomTextFieldReadOnly({
    Key? key,
    required this.hint,
    required this.text,
  }) : super(key: key);

  final String hint;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          hint,
          style: const TextStyle(
            color: Colors.grey,
            fontSize: 12,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.only(
            top: 12,
            left: 15,
          ),
          height: 43,
          width: double.infinity,
          decoration: BoxDecoration(
            color: GlobalVariables.textFieldColor,
            borderRadius: BorderRadius.circular(6),
          ),
          child: Text(
            text,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
        )
      ],
    );
  }
}
