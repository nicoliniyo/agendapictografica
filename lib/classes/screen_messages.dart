
import 'package:flutter/material.dart';

class ScreenMessages {

  static snackBarMessage(String text, BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.pink,
        content: Text(text),
      ),
    );
  }

}