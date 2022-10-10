// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gaadidho/common/constants/utils.dart';
import 'package:http/http.dart' as http;

void httpErrorHandle({
  required http.Response response,
  required BuildContext context,
  required Function onSuccess,
}) {
  switch (response.statusCode) {
    case 200:
      onSuccess();
      break;
    case 400:
      showSnackBar(context, jsonDecode(response.body)['msg']);
      print(jsonDecode(response.body)['error']);
      break;
    case 500:
      showSnackBar(context, jsonDecode(response.body)['error']);
      print(jsonDecode(response.body)['error']);
      break;
    default:
      showSnackBar(context, "${jsonDecode(response.body)}");
      print("jsonDecode(response.body) ");
  }
}
