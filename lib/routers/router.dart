import 'package:flutter/material.dart';
import 'package:gaadidho/common/widgets/bottom_bar.dart';
import 'package:gaadidho/features/bike_info/view/screen/bike_info_screen.dart';
import 'package:gaadidho/features/bike_registration/view/screens/register_end.dart';
import 'package:gaadidho/features/bike_registration/view/screens/register_starter.dart';
import 'package:gaadidho/features/home/view/screens/home_screen.dart';
import 'package:gaadidho/features/refer_and_earn/view/screens/refer_and_earn_screen.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case HomeScreen.routeName:
      return MaterialPageRoute(
        builder: (_) => const HomeScreen(),
      );

    case BikeRegisterStarter.routeName:
      var user = routeSettings.arguments;
      return MaterialPageRoute(
        builder: (_) => BikeRegisterStarter(user: user),
      );

    case BikeRegisterEnd.routeName:
      return MaterialPageRoute(
        builder: (_) => const BikeRegisterEnd(),
      );

    case BottomBar.routeName:
      return MaterialPageRoute(
        builder: (_) => const BottomBar(),
      );

    case ReferAndEarnScreen.routeName:
      return MaterialPageRoute(
        builder: (_) => const ReferAndEarnScreen(),
      );

    case BikeInfoScreen.routeName:
      return MaterialPageRoute(
        builder: (_) => const BikeInfoScreen(),
      );

    // case OtpScreen.routeName:
    //   return MaterialPageRoute(
    //     builder: (_) => const OtpScreen(),
    //   );

    default:
      return MaterialPageRoute(
        builder: (_) => const Scaffold(
          body: Center(
            child: Text("Screen does not exist"),
          ),
        ),
      );
  }
}
