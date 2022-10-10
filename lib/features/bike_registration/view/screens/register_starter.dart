// ignore_for_file: prefer_typing_uninitialized_variables, avoid_print

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gaadidho/common/constants/constants.dart';
import 'package:gaadidho/common/constants/utils.dart';
import 'package:gaadidho/common/widgets/custom_buttom.dart';
import 'package:gaadidho/common/widgets/custom_divider.dart';
import 'package:gaadidho/common/widgets/custom_textfield.dart';
import 'package:gaadidho/common/widgets/show_banner.dart';
import 'package:gaadidho/common/widgets/show_schedule.dart';
import 'package:gaadidho/features/bike_registration/view/screens/register_end.dart';
import 'package:share_plus/share_plus.dart';

class BikeRegisterStarter extends StatefulWidget {
  static const String routeName = "/bike-register-starter";

  const BikeRegisterStarter({Key? key, this.user}) : super(key: key);

  final user;

  @override
  State<BikeRegisterStarter> createState() => _BikeRegisterStarterState();
}

class _BikeRegisterStarterState extends State<BikeRegisterStarter> {
  @override
  Widget build(BuildContext context) {
    print(widget.user);

    void shareApp() async {
      try {
        const urlPreview =
            "https://play.google.com/store/apps/details?id=com.wash.gaadidho";
        await Share.share("Download GaadiDho now, \n\n$urlPreview");
      } catch (e) {
        showSnackBar(context, "Unable to share, Please try again later.");
      }
    }

    // ignore: unused_local_variable
    List<File>? images;

    void selectImages() async {
      var res = await pickImages();

      setState(() {
        images = res;
      });
    }

    final bikeNumberController = TextEditingController();
    final bikeCompanyController = TextEditingController();

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
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 15),
              CustomTextField(
                text: "Bike Number",
                controller: bikeNumberController,
              ),
              const SizedBox(height: 15),
              Row(
                children: [
                  Expanded(
                    child: CustomTextField(
                      text: "Bike Company",
                      controller: bikeCompanyController,
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child:
                        //  images == null ?
                        GestureDetector(
                      onTap: selectImages,
                      child: ListTile(
                        dense: true,
                        tileColor: GlobalVariables.textFieldColor,
                        leading: const Icon(Icons.image),
                        horizontalTitleGap: 0,
                        title: const Text(
                          'Upload photo',
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                    ),
                    // : Image.file(images![0]),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              CustomButton(
                  text: "Next (1/2)",
                  onPressed: () {
                    Navigator.of(context).pushNamed(BikeRegisterEnd.routeName);
                  }),
              const CustomDrawer(),
              const ShowBanner(imageUrl: "https://i.imgur.com/MOoE8oE.png"),
              const ShowSchedule()
            ],
          ),
        ),
      ),
    );
  }
}
