// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:gaadidho/common/constants/constants.dart';
import 'package:gaadidho/common/constants/utils.dart';
import 'package:url_launcher/url_launcher.dart';

class ShowShop extends StatelessWidget {
  const ShowShop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        try {
          String googleMapUrl =
              "https://www.google.com/maps/@37.7765141,-122.4528353,13z";
          await launch(googleMapUrl);
        } catch (e) {
          showSnackBar(
              context, "Could not open the map, Please try again later");
        }
      },
      child: Container(
        height: 70,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: GlobalVariables.textFieldColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Icon(
              Icons.location_on_sharp,
              color: Colors.blue,
              size: 35,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Nearest BikeDho Washing Point",
                  style: TextStyle(
                    color: GlobalVariables.customGreyColor,
                    fontSize: 10,
                  ),
                ),
                const Text(
                  "BikeDho, Opp Bharat Petrol Pump, Kothanur\nDinne Main Rd, JP Nagar 7th Phase ...",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 12),
                ),
              ],
            ),
            const Icon(
              Icons.directions,
              color: Colors.blue,
              size: 35,
            ),
          ],
        ),
      ),
    );
  }
}
