import 'dart:io';

import 'package:app/classes/database_provider.dart';
import 'package:app/classes/local_storage.dart';
import 'package:app/data/pec.dart';
import 'package:app/widgets/app_drawer.dart';
import 'package:app/widgets/card_pec.dart';
import 'package:app/widgets/list_droppable_pecs.dart';
import 'package:flutter/material.dart';

class DbPecs extends StatefulWidget {
  const DbPecs({super.key});

  @override
  State<DbPecs> createState() {
    return _DbPecs();
  }
}

class _DbPecs extends State<DbPecs> {
  bool variablesUpdated = false;
  late Widget blankPec; //= sizedBoxBlank();
  late Widget blankPec2; //= sizedBoxBlank();
  List<Pec> column1Items = List.empty(growable: true);

  Widget sizedBoxBlank() {
    return Container(
      width: 100,
      decoration: new BoxDecoration(
        borderRadius: new BorderRadius.circular(16.0),
        color: Colors.black12,
      ),
    );
  }

  updateCatalog() async {
    await DatabaseProvider().loadPecs().then((value) => column1Items = value);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    if (!variablesUpdated) {
      updateCatalog();
    }
  }

  List<Stack> toGrid() {
    var list = column1Items.map((pec) {
      String? titleFile = pec.keywords;
      File itemFile = File(pec.localImgPath!);
      print(titleFile! + ' -> ' + itemFile.path);
      var internalCard = CardPec(title: titleFile, imgFile: itemFile);
      return Stack(
          alignment: Alignment.bottomCenter, children: [
        internalCard,
        Text('$titleFile'),
        //SizedBox(height: 10,)
      ]);
    }).toList();
    return list;
  }

  @override
  Widget build(BuildContext context) {
    bool showPecsLane = true;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'DB Catalogo Pecs ()',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              setState(() {
                showPecsLane = false;
              });
            },
          ),
        ],
      ),
      drawer: const MainAppDrawer(),
      //body: const IndependentScrollableColumns(),
      body: GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 1,
          crossAxisSpacing: 5,
          mainAxisSpacing: 10,
        ),
        children: [
          ...toGrid(),
        ],
      ),

      // Container(
      //   padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
      // child: Row(
      //
      //   // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //   children: [
      //
      //     Container(
      //       width: 100,
      //       //flex: 1,
      //       child:
      //       ListView.builder(
      //         itemCount: column1Items.length,
      //         itemBuilder: (BuildContext context, int index) {
      //           String titleFile = column1Items[index].path.split('/').last;
      //           File itemFile = column1Items[index];
      //           print(titleFile + ' -> ' + itemFile.path);
      //           var internalCard = CardPec(title: titleFile, imgFile: itemFile);
      //           // Wrap the CardPec with Draggable
      //           return Column( children:
      //             [
      //               Text('$titleFile'),
      //               internalCard,
      //               SizedBox(height: 10,)
      //             ]
      //           );
      //         },
      //       ),
      //     ),
      //
      //
      //   ],
      // ),
      // ),
    );
  }
}
