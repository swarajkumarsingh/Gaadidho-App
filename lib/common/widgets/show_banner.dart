import 'package:flutter/material.dart';

class ShowBanner extends StatelessWidget {
  // For asset Image
  final String imageUrl;
  const ShowBanner({
    Key? key, required this.imageUrl,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      width: double.infinity,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.network(
          imageUrl,
        ),
      ),
    );
  }
}
