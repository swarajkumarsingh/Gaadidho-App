import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:gaadidho/common/constants/constants.dart';
import 'package:gaadidho/common/constants/utils.dart';
import 'package:gaadidho/common/widgets/bottom_bar.dart';
import 'package:gaadidho/common/widgets/no_net_screen.dart';
import 'package:gaadidho/routers/router.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    checkInternetConnection();
  }

  bool isNet = true;

  checkInternetConnection() async {
    await Utility.checkInternet().then((value) {
      setState(() {
        isNet = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    print(isLoggedIn);
    return MaterialApp(
      title: 'GaadiDho',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "poppins",
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: GlobalVariables.primaryColor,
          secondary: GlobalVariables.primaryColor,
        ),
      ),

      //  Route file
      onGenerateRoute: (settings) => generateRoute(settings),

      // Main Page
      home: isNet ? const BottomBar() : const NoNetScreen(),
    );
  }
}
