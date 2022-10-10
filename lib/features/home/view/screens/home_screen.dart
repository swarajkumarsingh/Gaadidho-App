// ignore_for_file: avoid_print, prefer_const_constructors

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gaadidho/common/constants/constants.dart';
import 'package:gaadidho/common/widgets/bottom_bar.dart';
import 'package:gaadidho/common/widgets/custom_divider.dart';
import 'package:gaadidho/common/widgets/show_banner.dart';
import 'package:gaadidho/common/widgets/show_schedule.dart';
import 'package:gaadidho/features/auth/controller/auth_controller.dart';
import 'package:gaadidho/features/home/model/Home.dart';
import 'package:gaadidho/features/home/view/widgets/custom_appbar.dart';
import 'package:gaadidho/features/home/view/widgets/show_shop.dart';
import 'package:gaadidho/features/home/view/widgets/show_subscription.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'package:get_storage/get_storage.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "/home-screen";
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: HomeScreenBody(reBuilder: () {}),
      floatingActionButton: isLoggedIn
          ? FloatingActionButton(
              onPressed: () {
                final box = GetStorage();
                box.remove('x-auth-token');
                setState(() {
                  isLoggedIn = false;
                });

                Navigator.pushNamed(context, BottomBar.routeName);
              },
              child: const Icon(Icons.logout_rounded),
            )
          : null,
    );
  }
}

class HomeScreenBody extends StatefulWidget {
  final Function reBuilder;
  const HomeScreenBody({
    Key? key,
    required this.reBuilder,
  }) : super(key: key);

  @override
  State<HomeScreenBody> createState() => _HomeScreenBodyState();
}

class _HomeScreenBodyState extends State<HomeScreenBody> {
  Future<Home> getProductsApi() async {
    final response = await http.get(Uri.parse(
        '${BASE_URI}/auth/bike-dho-home'));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      print("bf");
      return Home.fromJson(data);
    } else {
      return Home.fromJson(data);
    }
  }

  @override
  Widget build(BuildContext context) {
    final AuthController pcontroller = Get.put(AuthController());
    print("pcontroller.userToken_result ${pcontroller.userToken_result}");

    return SafeArea(
      child: Container(
        padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
        child: SingleChildScrollView(
          child: FutureBuilder<Home>(
            future: getProductsApi(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                print(snapshot.data!.data.topBanner.banners[0].image);
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),

                    // App Bar
                    const AppBarWidget(),
                    Container(height: 15),

                    // Show Shop
                    const ShowShop(),

                    // Bike wash schedule
                    Obx(() {
                      return pcontroller.userToken_result.isNotEmpty
                          ? const ShowSchedule()
                          : Container();
                    }),
                    Container(height: 15),

                    // Top Banner
                    ShowBanner(
                      imageUrl: snapshot.data!.data.topBanner.banners[0].image,
                    ),

                    // Drawer
                    const CustomDrawer(),
                    const ShowSubscription(),

                    // Drawer
                    const CustomDrawer(),

                    // Bottom Banner
                    ShowBanner(
                      imageUrl: snapshot.data!.data.bottomBanner.banners[0].image,
                    ),
                  ],
                );
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
        ),
      ),
    );
  }
}
