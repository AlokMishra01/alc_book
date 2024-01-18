import 'package:alc_book/src/constants/colors.dart';
import 'package:flutter/material.dart';

class SnackbarMessage {
  static message({required String message, required BuildContext context}) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    final snackBar = SnackBar(
      duration: const Duration(milliseconds: 1500),
      backgroundColor: AppColors.primary,
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 130),
      // padding: EdgeInsets.all(50),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ), // clipBehavior: Clip.antiAlias,
      content: Center(
          child: Text(
        message,
        // style: const TextStyle(fontSize: 12),
      )),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
