import 'dart:io';


import 'package:app/classes/database_provider.dart';
import 'package:app/classes/local_storage.dart';
import 'package:app/data/pec.dart';
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
  CardPec? blankPec ; //= sizedBoxBlank();
  CardPec? blankPec2 ; //= sizedBoxBlank();
  CardPec? blankPec3 ; //= sizedBoxBlank();
  CardPec? blankPec4 ; //= sizedBoxBlank();
  CardPec? blankPec5 ; //= sizedBoxBlank();
  CardPec? blankPec6 ; //= sizedBoxBlank();
  List<Pec> column1Items = List.empty(growable: true);
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
    var cardPec = CardPec.blank(true);
    blankPec = cardPec;
    blankPec2 = cardPec;
    blankPec3 = cardPec;
    blankPec4 = cardPec;
    blankPec5 = cardPec;
    blankPec6 = cardPec;

  }
  updateCatalog() async {
    await DatabaseProvider().loadPecs().then((value) => column1Items = value);
    setState(() {

    });

  }

  @override
  void initState() {
    super.initState();
    //if(!variablesUpdated){
      updateCatalog();
    //   variablesUpdated = true;
    // }
    loadBlankPec();
  }

  @override
  Widget build(BuildContext context)  {
    bool showPecsLane = true;
    
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Actividades',
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
      body: Container(
        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: Row(

              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 150,
                  //flex: 1,
                  child:
                  ListView.builder(
                    //physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: column1Items.length,
                    itemBuilder: (BuildContext context, int index) {
                      String? titleFile = column1Items[index].keywords;
                      var localImgPath = column1Items[index].localImgPath;
                      File itemFile = File(localImgPath!);
                      print(titleFile! + ' -> ' + itemFile.path);
                      var internalCard = CardPec(title: titleFile, imgFile: itemFile);
                      var stackCard = Stack(
                        alignment: Alignment.bottomCenter,
                          children: [
                            Text(titleFile),
                            CardPec(title: titleFile, imgFile: itemFile)
                          ],
                      );


                      var expandedCard = Expanded(
                         flex: 1,
                         //child: CardPec(title: titleFile, imgFile: itemFile),
                         child: stackCard
                       );
                      // Wrap the CardPec with Draggable
                      var item = Column(
                        children: [
                          expandedCard,
                        const SizedBox(height: 10,)
                      ],);
                      return
                        SizedBox(

                        width: 100,
                        height: 100,
                        //key: ValueKey(column1Items[index]),
                          child : Draggable<CardPec>(
                            key: ValueKey(column1Items[index]),
                            feedback: internalCard,
                            child: item,//internalCard,
                            childWhenDragging: Opacity(
                              opacity: 0.5,
                              child: internalCard,
                            ),
                            data: internalCard, // Data to identify the item
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(width: 50,),
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
                                blankPec as CardPec,
                              ],
                            );
                          },
                        onWillAccept: (cardPec) =>true,
                        onAccept: (CardPec cardPec) {
                          blankPec = cardPec;
                        },
                      ),
                      const SizedBox(height: 10,),
                      DragTarget<CardPec>(
                        builder: (BuildContext context, List<CardPec?> candidateData, List<dynamic> rejectedData) {
                          return Row(
                            children: [
                              blankPec2 as CardPec,
                            ],
                          );
                        },
                        onWillAccept: (cardPec) =>true,
                        onAccept: (CardPec cardPec) {
                          blankPec2 = cardPec;
                        },
                      ),
                      const SizedBox(height: 10,),
                      DragTarget<CardPec>(
                        builder: (BuildContext context, List<CardPec?> candidateData, List<dynamic> rejectedData) {
                          return Row(
                            children: [
                              blankPec3 as CardPec,
                            ],
                          );
                        },
                        onWillAccept: (cardPec) =>true,
                        onAccept: (CardPec cardPec) {
                          blankPec3 = cardPec;
                        },
                      ),
                      const SizedBox(height: 10,),
                      DragTarget<CardPec>(
                        builder: (BuildContext context, List<CardPec?> candidateData, List<dynamic> rejectedData) {
                          return Row(
                            children: [
                              blankPec4 as CardPec,
                            ],
                          );
                        },
                        onWillAccept: (cardPec) =>true,
                        onAccept: (CardPec cardPec) {
                          blankPec4 = cardPec;
                        },
                      ),
                      const SizedBox(height: 10,),
                      DragTarget<CardPec>(
                        builder: (BuildContext context, List<CardPec?> candidateData, List<dynamic> rejectedData) {
                          return Row(
                            children: [
                              blankPec5 as CardPec,
                            ],
                          );
                        },
                        onWillAccept: (cardPec) =>true,
                        onAccept: (CardPec cardPec) {
                          blankPec5 = cardPec;
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