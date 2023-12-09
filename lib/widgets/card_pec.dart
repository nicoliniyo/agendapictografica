import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// ignore: must_be_immutable
class CardPec extends StatelessWidget {
  // CardPec.blank(bool blank, {super.key}){
  //   // Pec pecObj = PictogramUtils.toPec(pictogram);
  //   // id = pecObj.id;
  //    title = '';
  //   // description = pecObj.description;
  //    imgFile = Image.file(rootBundle.load('assets/img/blank.png'));
  //   // tap = (){};
  // }
  
  CardPec(
      // String title,  File imgFile,
      {
        super.key,
        required this.title,
        required this.imgFile,

       });

  String title;
  File imgFile;

 

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 140,
      height: 160,
        child:
        Card(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 5,
                  vertical: 5,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: 
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                             Image.file(imgFile),
                            //  Text('title'),
                             Text(title),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
    );
  }
}
