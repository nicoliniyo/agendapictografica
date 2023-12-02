import 'dart:io';

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CardPec extends StatelessWidget {
  // CardPec.fromPictogram(Pictograms pictogram, {super.key}){
  //   Pec pecObj = PictogramUtils.toPec(pictogram);
  //   id = pecObj.id;
  //   title = pecObj.keywords;
  //   description = pecObj.description;
  //   imgUrl = PecsUrlBuilder().pictograms(pecObj.id.toString());
  //   tap = (){};
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
    return Card(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 8,
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
                        // const Expanded(
                        //   flex: 1,
                        //   child: 
                        //   Row(
                        //   children: [
                        //     Spacer(),
                        //     Icon(Icons.list_outlined),               
                        //     SizedBox(width: 8),
                        //     Icon(Icons.star_border_outlined),
                            
                        //   ],
                        // ),
                        // )
                      ],
                    ),
                  ],
                ),
              ),
            );
  }
}
