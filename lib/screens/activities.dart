import 'dart:io';


import 'package:app/classes/local_storage.dart';
import 'package:app/widgets/app_drawer.dart';
import 'package:app/widgets/card_pec.dart';
import 'package:app/widgets/list_droppable_pecs.dart';
import 'package:flutter/material.dart';

class Activities extends StatefulWidget {
  const Activities({super.key});

  @override
  State<Activities> createState() {
    return _Activities();
  }

}

class _Activities extends State<Activities> {
  bool variablesUpdated = false;
  late Widget blankPec ; //= sizedBoxBlank();
  late Widget blankPec2 ; //= sizedBoxBlank();
  List<File> column1Items = List.empty(growable: true);
  List<CardPec> column2Items = [];
  List<int> column3Items = List.generate(3, (index) => (index + 1) * 3);

  Widget sizedBoxBlank() {
    return Container(
            width: 100,
            decoration: new BoxDecoration(
              borderRadius: new BorderRadius.circular(16.0),
              color: Colors.black12,
            ),
    );
  }
  loadBlankPec() async {
    var file = await LocalStorage().getImageFileFromAssets('assets/img/blank.png');
    blankPec = CardPec(title: '', imgFile: file);
    blankPec2 = CardPec(title: '', imgFile: file);
    // column2Items.add(blankPec);
    // column2Items.add(blankPec);
    // column2Items.add(blankPec);
    // column2Items.add(blankPec);
    // column2Items.add(blankPec);
    // column2Items.add(blankPec);
    // column2Items.add(blankPec);
    // column2Items.add(blankPec);
    // column2Items.add(blankPec);
    // column2Items.add(blankPec);

  }
  updateCatalog() async {
    column1Items = await LocalStorage().listPngFiles();
    setState(() {

    });

  }

  @override
  void initState() {
    super.initState();
    if(!variablesUpdated){
      updateCatalog();
    }
    loadBlankPec();
  }

  @override
  Widget build(BuildContext context)  {
    
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Actividades',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {},
          ),
        ],
      ),
      drawer: const MainAppDrawer(),
      //body: const IndependentScrollableColumns(),
      body: Container(
        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: Row(

              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container( width: 140,
                  //flex: 1,
                  child:
                  ListView.builder(
                    itemCount: column1Items.length,
                    itemBuilder: (BuildContext context, int index) {
                      String titleFile = column1Items[index].path.split('/').last;
                      File itemFile = column1Items[index];
                      print(titleFile + ' -> ' + itemFile.path);
                      var internalCard = CardPec(title: titleFile, imgFile: itemFile);
                      // Wrap the CardPec with Draggable
                      return
                        Container(
                        width: 100,
                        height: 100,
                        //key: ValueKey(column1Items[index]),
                          child : Draggable<CardPec>(
                            key: ValueKey(column1Items[index]),
                            //axis: Axis.horizontal,
                            feedback: internalCard,
                            child: internalCard,
                            childWhenDragging: Opacity(
                              opacity: 0.5,
                              child: internalCard,
                            ),
                            // Widget when dragging
                            data: internalCard, // Data to identify the item
                        ),
                      );
                    },
                    // onReorder: (oldIndex, newIndex) {
                    //   setState(() {
                    //     if (newIndex > oldIndex) {
                    //       newIndex -= 1;
                    //     }
                    //     final File item = column1Items.removeAt(oldIndex);
                    //     column1Items.insert(newIndex, item);
                    //   });
                    // },
                  ),
                ),
                SizedBox(width: 50,),
                Expanded(
                  flex: 1,
                  child:
                  Column(
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    // mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      //blankPec,
                      DragTarget<CardPec>(
                          builder: (BuildContext context, List<CardPec?> candidateData, List<dynamic> rejectedData) {
                            return Row(

                              children: [
                                // Text('grad her!'),
                                blankPec,
                                // Text('grad her!'),
                                //(candidateData.first! != null ? candidateData.first! : blankPec),
                              ],
                            );
                          },
                        onWillAccept: (cardPec) =>true,
                        onAccept: (CardPec cardPec) {
                          print("OnAccept!");
                          blankPec = cardPec;
                        },
                      ),
                      SizedBox(height: 10,),
                      DragTarget<CardPec>(
                        builder: (BuildContext context, List<CardPec?> candidateData, List<dynamic> rejectedData) {
                          return Row(
                            children: [
                              blankPec2
                              //(candidateData.first! != null ? candidateData.first! : blankPec),
                            ],
                          );
                        },
                        onWillAccept: (cardPec) =>true,
                        onAccept: (CardPec cardPec) {
                          print("OnAccept!");
                          blankPec2 = cardPec;
                        },
                      ),
                    ],
                  ),
                ),
                  // child: ReorderableListView.builder(
                  //   itemCount: 1,
                  //   // Add 1 for the potential dropped item
                  //   itemBuilder: (BuildContext context, int index) {
                  //     String titleFile = column1Items[index].path.split('/').last;
                  //     File itemFile = column1Items[index];
                  //     print(titleFile + ' -> ' + itemFile.path);
                  //     return ListDroppablePec();
                  //
                  //   },
                  //   onReorder: (oldIndex, newIndex) {
                  //     setState(() {
                  //       if (newIndex > oldIndex) {
                  //         newIndex -= 1;
                  //       }
                  //       final CardPec item = column2Items.removeAt(oldIndex);
                  //       column2Items.insert(newIndex, item);
                  //     });
                  //   },
                  // ),
                // ),



                // Expanded(
                //   flex: 1,
                //   child:
                //   ListView.builder(
                //     itemCount: column3Items.length,
                //     itemBuilder: (BuildContext context, int index) {
                //       return ListTile(
                //         title: Container(
                //           width: 100,
                //           height: 100,
                //           decoration: new BoxDecoration(
                //             borderRadius: new BorderRadius.circular(16.0),
                //             color: Colors.black12,
                //           ),
                //
                //             child: Center(
                //               child: Text('Column 3 Item ${column3Items[index]}'),),
                //           ),
                //       );
                //     },
                //   ),
                // ),
              ],
            ),
      ),
    );
  }
}