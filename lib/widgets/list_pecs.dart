import 'dart:io';

import 'package:app/classes/app_logger.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'card_pec.dart';

class ListPecs extends StatelessWidget {
  ListPecs.loadLocalPecs(
      this.column1Items,
      {super.key, required this.expanded,} ) {
    column1Items = List.empty(growable: true);
    //updateCatalog();
  }

  ListPecs({
    super.key,
    required this.expanded,
    required this.column1Items,
  } );

  final bool expanded;
  late List<File> column1Items;

  // updateCatalog() async {
  //   column1Items = await LocalStorage().listPngFiles();
  //   print('updateCatalog Size local pecs: ${column1Items.length}');
  //   //List<File> list = List.of(column1Items);
  //   //return column1Items;
  // }

  @override
  Widget build(BuildContext context) {
    var logger = AppLogger();
    //updateCatalog();
    logger.prettyInfoMsg('Size local pecs: ${column1Items.length}');
    return SizedBox(
      width: (expanded ? 120 : 20),
      //flex: 1,
      child:
        expanded ?
            SizedBox(
                width: 120,
                // height: ,
                child:
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: column1Items.length,
                    itemBuilder: (BuildContext context, int index) {
                    String titleFile = column1Items[index].path.split('/').last;
                    File itemFile = column1Items[index];
                    logger.prettyInfoMsg('$titleFile -> ${itemFile.path}');
                    var internalCard = CardPec(title: titleFile, imgFile: itemFile);
                  // Wrap the CardPec with Draggable
                    return
                      SizedBox(
                    width: 100,
                    height: 100,
                    child : Draggable<CardPec>(
                      key: ValueKey(column1Items[index]),
                      feedback: internalCard,
                      childWhenDragging: Opacity(
                        opacity: 0.5,
                        child: internalCard,
                      ),
                      data: internalCard,
                      child: internalCard, // Data to identify the item
                    ),
                  );
                    },
                  )
            )
            : const Text('Ninguna imagen local'),

        // : IconButton(
        //     onPressed: () {},
        //     icon: const Icon( Icons.arrow_right_alt_outlined),
        //   )
    );
  }

}