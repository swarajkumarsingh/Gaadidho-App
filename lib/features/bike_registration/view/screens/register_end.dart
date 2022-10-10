import 'package:flutter/material.dart';
import 'package:gaadidho/common/constants/constants.dart';
import 'package:gaadidho/common/constants/utils.dart';
import 'package:gaadidho/common/widgets/custom_buttom.dart';
import 'package:gaadidho/common/widgets/custom_divider.dart';
import 'package:gaadidho/common/widgets/custom_textfield.dart';
import 'package:gaadidho/common/widgets/show_banner.dart';
import 'package:gaadidho/common/widgets/show_schedule.dart';
import 'package:gaadidho/features/bike_info/view/screen/bike_info_screen.dart';
import 'package:share_plus/share_plus.dart';

class BikeRegisterEnd extends StatelessWidget {
  static const String routeName = "/bike-register-end";

  const BikeRegisterEnd({Key? key}) : super(key: key);

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

    void navigateScreen() {
      Navigator.of(context).pushNamed(BikeInfoScreen.routeName);
    }

    final homecontroller = TextEditingController();
    final mapcontroller = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
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
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
              onPressed: shareApp,
              icon: Icon(
                Icons.share_rounded,
                color: GlobalVariables.backArrowColor,
                size: 25,
              ),
            ),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Complete Registration\nto Start Bike Wash Service",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 20),
              ),
              const SizedBox(height: 15),
              CustomTextField(
                text: "Home Delivery Address",
                controller: homecontroller,
              ),
              const SizedBox(height: 15),
              CustomTextField(
                text: "Google Map Location",
                controller: mapcontroller,
              ),
              const SizedBox(height: 30),
              CustomButton(
                text: "Done",
                onPressed: navigateScreen,
              ),
              const CustomDrawer(),
              const ShowBanner(imageUrl: "https://i.imgur.com/MOoE8oE.png",),
              const ShowSchedule()
            ],
          ),
        ),
      ),
    );
  }
}
