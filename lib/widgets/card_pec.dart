import 'dart:io';

import 'package:app/data/pec.dart';
import 'package:flutter/material.dart';

class CardPec extends StatelessWidget {
  CardPec.fromPec(Pec pec, {super.key}) {
    title = pec.keywords;
    imgFile = File(pec.localImgPath!);
    blank = false;
    pecObject = pec;
  }

  CardPec.blank(bool forceBlank, {super.key}) {
    title = '';
    imgFile = File('');
    blank = forceBlank;
  }

  CardPec({
    super.key,
    required this.title,
    required this.imgFile,
    this.blank = false,
    this.pecObject,
  });

  String? title;
  File? imgFile;
  bool? blank;
  Pec? pecObject;

  Pec get pecObj {
    return pecObject!;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 110,
      height: 110,
      child: Card(
        child: blank!
            ? const Icon(
                Icons.image,
                size: 48,
                color: Colors.black38,
              )
            : Image.file(imgFile!,
              ),
      ),
    );
  }
}
