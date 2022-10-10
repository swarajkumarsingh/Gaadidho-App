import 'package:flutter/material.dart';
import 'package:gaadidho/common/constants/constants.dart';
import 'package:gaadidho/common/constants/utils.dart';
import 'package:gaadidho/features/auth/view/screens/auth_bottom_sheet.dart';
import 'package:gaadidho/features/bike_info/view/screen/bike_info_screen.dart';
import 'package:gaadidho/features/bike_registration/view/screens/register_starter.dart';
import 'package:gaadidho/features/home/view/screens/home_screen.dart';
import 'package:url_launcher/url_launcher.dart';

class BottomBar extends StatefulWidget {
  static const String routeName = '/actual-home';
  const BottomBar({Key? key}) : super(key: key);

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _page = 0;
  double bottomBarWidth = 42;
  double bottomBarBorderWidth = 5;

  List<Widget> pages = [
    const HomeScreen(),
    const HomeScreen(),
    const HomeScreen()
  ];

  void updatePage(int page) {
    setState(() {
      _page = page;
    });
  }

  void showBottomModel() {
    showModalBottomSheet<void>(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(10.0),
        ),
      ),
      context: context,
      builder: (_) {
        return const BottomModelWidget();
      },
    );
  }

  void navigateToReferScreen() {
    Navigator.of(context).pushNamed(BikeInfoScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    void whatsappRedirect() async {
      try {
        var msg = "Hey there I need some help.";
        var url = "https://wa.me/+918789427835?text=$msg";
        // ignore: deprecated_member_use
        await launch(url);
      } catch (e) {
        showSnackBar(context, "Unable to get support, Please try again.");
      }
    }

    // bool isLoggedIn = true;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      // resizeToAvoidBottomPadding:false,

      body: pages[_page],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _page,
        selectedItemColor: GlobalVariables.selectedNavBarColor,
        unselectedItemColor: GlobalVariables.unselectedNavBarColor,
        backgroundColor: GlobalVariables.backgroundColor,
        showUnselectedLabels: false,
        iconSize: 28,
        onTap: updatePage,
        items: [
          // HOME
          BottomNavigationBarItem(
            icon: Container(
              width: bottomBarWidth,
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: _page == 0
                        ? GlobalVariables.selectedNavBarColor
                        : GlobalVariables.backgroundColor,
                    width: bottomBarBorderWidth,
                  ),
                ),
              ),
              child: const Icon(
                Icons.home_rounded,
              ),
            ),
            label: 'Home',
          ),
          // ACCOUNT
          BottomNavigationBarItem(
            icon: GestureDetector(
              onTap: whatsappRedirect,
              child: Container(
                width: bottomBarWidth,
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(
                      color: _page == 1
                          ? GlobalVariables.selectedNavBarColor
                          : GlobalVariables.backgroundColor,
                      width: bottomBarBorderWidth,
                    ),
                  ),
                ),
                child: const Icon(
                  Icons.support_agent_sharp,
                ),
              ),
            ),
            label: 'Support',
          ),
          BottomNavigationBarItem(
            icon: GestureDetector(
              onTap: box.read('x-auth-token') == null
                  ? showBottomModel
                  : box.read('x-auth-token') != null
                      ? () {
                          Navigator.pushNamed(
                            context,
                            BikeRegisterStarter.routeName,
                            arguments: box.read('x-auth-token'),
                          );
                        }
                      : showBottomModel,
              child: Container(
                width: bottomBarWidth,
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(
                      color: _page == 2
                          ? GlobalVariables.selectedNavBarColor
                          : GlobalVariables.backgroundColor,
                      width: bottomBarBorderWidth,
                    ),
                  ),
                ),
                child: const Icon(Icons.account_circle_outlined),
              ),
            ),
            label: 'Account',
          ),
        ],
      ),
    );
  }
}
