import 'package:flutter/material.dart';

class NoNetScreen extends StatefulWidget {
  const NoNetScreen({Key? key}) : super(key: key);

  @override
  State<NoNetScreen> createState() => _NoNetScreenState();
}

class _NoNetScreenState extends State<NoNetScreen> {
  @override
  Widget build(BuildContext context) {
    // var getOperatingSystem = DeviceInfoApi.getPhoneInfo().then((value) {
    //   print(value);
    // });

    return Scaffold(
      appBar: AppBar(
        title: const Text("No Internet"),
      ),
      body: Center(
        child: Column(
          children: const [
            Text("NO Internet Connection"),
          ],
        ),
      ),
    );
  }
}
