// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

String BASE_URI = 'BACKEND_BASE_URI';

final box = GetStorage();

bool isLoggedIn = box.read('x-auth-token') == null ? false : true;

class GlobalVariables {
  // COLORS
  static const appBarGradient = LinearGradient(
    colors: [
      Color.fromARGB(255, 29, 201, 192),
      Color.fromARGB(255, 125, 221, 216),
    ],
    stops: [0.5, 1.0],
  );

  // Buy Sub1 Images
  static const List<String> bannerImages = [
    "https://res.cloudinary.com/swaraj-cloud/image/upload/v1658591876/GaadiDHo/tben9jdhnocw1glky0jw.webp",
    "https://res.cloudinary.com/swaraj-cloud/image/upload/v1658339976/GaadiDHo/kihiovstdwgixzclm7ka.png",
    "https://res.cloudinary.com/swaraj-cloud/image/upload/v1658591876/GaadiDHo/gajt7xk6lvxzuqbxsoes.webp",
  ];

  // Buy Sub2 Images
  static const List<String> carouselImages = [
    "https://res.cloudinary.com/swaraj-cloud/image/upload/v1658339976/GaadiDHo/flvoosps10tbtnetsx0g.png",
    "https://res.cloudinary.com/swaraj-cloud/image/upload/v1658339976/GaadiDHo/fnrzqpuadgaye5hmxy1l.png",
    "https://res.cloudinary.com/swaraj-cloud/image/upload/v1658339976/GaadiDHo/flvoosps10tbtnetsx0g.png",
    "https://res.cloudinary.com/swaraj-cloud/image/upload/v1658339976/GaadiDHo/fnrzqpuadgaye5hmxy1l.png",
  ];

  // Bike schedule
  static const List scheduleList = [
    {
      "leading": "1st service",
      "date": "27 August",
      "day": "(Monday)",
      "isFree": true,
      "status": "Completed"
    },
    {
      "leading": "2nd service",
      "date": "12 July",
      "day": "(Monday)",
      "isFree": false,
      "status": "Due Now"
    },
    {
      "leading": "3rd Service",
      "date": "30 May",
      "day": "(Monday)",
      "isFree": true,
      "status": "Completed"
    },
    {
      "leading": "3rd Service",
      "date": "30 May",
      "day": "(Monday)",
      "isFree": false,
      "status": "Due Now"
    },
  ];

  // Refer and Earn Image
  static const referImage =
      "https://res.cloudinary.com/swaraj-cloud/image/upload/v1658429023/GaadiDHo/whtjtmckygs8q8uquhr0.jpg";

  // Bike Image
  static const bikeUrl =
      "https://res.cloudinary.com/swaraj-cloud/image/upload/v1658429036/GaadiDHo/gzkvearkblqcfwgb1rhf.jpg";

  // App in use colors
  static const primaryColor = Color.fromRGBO(88, 219, 105, 1);
  static const secondaryColor = Color.fromRGBO(255, 153, 0, 1);
  static const deactivateButtonColor = Color.fromRGBO(0, 190, 130, 1);
  static const gaadiLogoColor = Color.fromRGBO(217, 54, 60, 1);
  static const dhoLogoColor = Color.fromRGBO(73, 83, 179, 1);
  static const dividerColor = Color.fromRGBO(235, 235, 235, 1);
  static const backgroundColor = Colors.white;
  static const Color greyBackgroundCOlor = Color(0xffebecee);
  static var selectedNavBarColor = const Color.fromRGBO(88, 219, 105, 1);
  static var unselectedNavBarColor = const Color.fromRGBO(89, 89, 95, 1);
  static var backArrowColor = const Color.fromRGBO(59, 59, 90, 1);
  static var textFieldColor = const Color.fromRGBO(243, 240, 240, 1);
  static var customGreyColor = const Color.fromRGBO(72, 72, 74, 1);
}
