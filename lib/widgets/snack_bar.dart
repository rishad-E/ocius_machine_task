
import 'package:flutter/material.dart';
import 'package:ociuz_task/utils/constant/colors.dart';


//custom snackbar to show the user
void showCustomSnackbar(
    {required String title,
    required String message,
    required BuildContext context}) {
  final snackBar = SnackBar(
    content: Text(
      message,
      style: TextStyle(color: kwhite),
    ),
    backgroundColor: Colors.grey[700],
    duration: const Duration(seconds: 2),
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}