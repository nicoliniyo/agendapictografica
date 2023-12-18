
import 'package:flutter/material.dart';

class ScreenMessageService {
  void snackBarMessage(String text, BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.pink,
        content: Text(text),
      ),
    );
  }
}