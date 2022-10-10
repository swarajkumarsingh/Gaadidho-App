import 'package:flutter/material.dart';
import 'package:gaadidho/common/constants/constants.dart';

class CustomTextField extends StatelessWidget {
  final String text;
  final TextInputType textInputType;
  final TextEditingController controller;
  const CustomTextField({
    Key? key,
    required this.text,
    this.textInputType = TextInputType.name,
    required this.controller,
  }) : super(key: key);

  final double height = 40;

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return SizedBox(
      // height: height,
      child: Form(
        key: formKey,
        child: TextFormField(
          // validator: (value) {},
          controller: controller,
          keyboardType: textInputType,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: text,
            fillColor: GlobalVariables.textFieldColor,
            filled: true,
          ),
        ),
      ),
    );
  }
}
