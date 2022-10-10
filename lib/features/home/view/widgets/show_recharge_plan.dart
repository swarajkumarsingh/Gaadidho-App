import 'package:flutter/material.dart';

class ShowRecharge extends StatelessWidget {
  final String networkUrl;
  const ShowRecharge({
    Key? key,
    required this.networkUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);

    // Got one image

    return Container(
      // height: 20,
      margin: const EdgeInsets.only(right: 10),
      width: mediaQueryData.size.width / 3,
      child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.network(
            networkUrl,
            fit: BoxFit.cover,
          )),
    );
  }
}
