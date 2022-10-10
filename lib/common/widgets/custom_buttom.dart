import 'package:flutter/material.dart';
import 'package:gaadidho/common/constants/constants.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final int height;
  final VoidCallback onPressed;

  const CustomButton({
    Key? key,
    required this.text,
    this.height = 43,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.parse(height.toString()),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: GlobalVariables.selectedNavBarColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(32.0),
          ),
        ),
        onPressed: onPressed,
        child: Center(
          child: Text(
            text,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
      ),
    );
  }
}
