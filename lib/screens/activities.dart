import 'dart:io';
import 'package:app/classes/screen_message_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:app/classes/database_provider.dart';
import 'package:app/data/pec.dart';
import 'package:app/widgets/app_drawer.dart';
import 'package:app/widgets/card_pec.dart';
import 'package:app/data/activities_notifier.dart';
import 'package:flutter/material.dart';

class Activities extends ConsumerStatefulWidget {
  const Activities({super.key});

  @override
  ConsumerState<Activities> createState() {
    return _Activities();
  }

}

class _Activities extends ConsumerState<Activities> {
  bool showPecsLane = false;
  CardPec? blankPec ; //= sizedBoxBlank();
  CardPec? blankPec2 ; //= sizedBoxBlank();
  CardPec? blankPec3 ; //= sizedBoxBlank();
  CardPec? blankPec4 ; //= sizedBoxBlank();
  CardPec? blankPec5 ; //= sizedBoxBlank();
  CardPec? blankPec6 ; //= sizedBoxBlank();
  List<Pec> column1Items = List.empty(growable: true);
  List<CardPec> listCardPecs = List.empty(growable: true);
  List<int> column3Items = List.generate(3, (index) => (index + 1) * 3);

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
    setState(() {});

  }

  loadPecsFromRPod() {
    var pecs = ref.watch(activitiesTodayProvider.notifier).state;
    listCardPecs = pecs;
    listCardPecs.asMap().forEach((index, value) {
        if(index == 0) {
          blankPec = value;
        }
        else if(index == 1) {
          blankPec2 = value;
        }
        else if(index == 2) {
          blankPec3 = value;
        }
        else if(index == 3) {
          blankPec4 = value;
        }
        else if(index == 4) {
          blankPec5 = value;
        }
      }
    );
    print('loadPecsFromRPod PROVIDER: $pecs');
    print('loadPecsFromRPod listCardPecs: ${listCardPecs.length}');
  }

  DragTarget<CardPec> createDropTarget(CardPec blankPec) {

    return DragTarget<CardPec>(
      //key: UniqueKey(),
      builder: (BuildContext context, List<CardPec?> candidateData, List<dynamic> rejectedData) {
        return Row(
          children: [
            blankPec,
          ],
        );
      },
      onWillAccept: (cardPec) =>true,
      onAccept: (CardPec cardPec) {
        blankPec = cardPec;
        listCardPecs.add(cardPec);

        print('DragTarget listCardPecs: ${listCardPecs.length}');
        ref.watch(activitiesTodayProvider.notifier)
            .updateAllCardActivities(listCardPecs);
      },
    );
  }

  @override
  void initState() {
    super.initState();
    updateCatalog();
    loadBlankPec();
    showPecsLane = true;
  }

  @override
  Widget build(BuildContext context) {
    loadPecsFromRPod();


    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Actividades para hoy',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh_outlined, semanticLabel: 'Limpiar',),
            onPressed: () {
              ref.watch(activitiesTodayProvider.notifier).clearActivities();
              ScreenMessageService().snackBarMessage('Actividades removidas', context);
              setState(() {
                // showPecsLane = false;
              });
            },
          ),
          IconButton(
            icon: showPecsLane ? const Icon(Icons.check,) : const Icon(Icons.edit,),
            onPressed: () {
              setState(() {
                showPecsLane = !showPecsLane;
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
                  child: (showPecsLane) ?
                  ListView.builder(
                    //physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: column1Items.length,
                    itemBuilder: (BuildContext context, int index) {
                      String? titleFile = column1Items[index].keywords;
                      var localImgPath = column1Items[index].localImgPath;
                      File itemFile = File(localImgPath!);
                      // print(titleFile! + ' -> ' + itemFile.path);
                      var internalCard = CardPec(title: titleFile, imgFile: itemFile);
                      var stackCard = Stack(
                        alignment: Alignment.bottomCenter,
                          children: [
                            Text(titleFile!),
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
                          child : Draggable<CardPec>(
                            key: ValueKey(column1Items[index]),
                            feedback: internalCard,
                            child: item,//internalCard,
                            childWhenDragging: Opacity(
                              opacity: 0.5,
                              child: internalCard,
                            ),
                            data: internalCard,
                            // onDragCompleted: (){
                              // print("DARG COMPLETE!");
                            // },// Data to identify the item
                        ),
                      );
                    },
                  )
                  :
                  IconButton(
                    icon: const Icon(
                      Icons.photo_library_outlined,
                      size: 48,
                    ),
                    onPressed: () {
                      setState(() {
                        showPecsLane = true;
                      });
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
                      createDropTarget(blankPec!),
                      const SizedBox(height: 10,),
                      createDropTarget(blankPec2!),
                      const SizedBox(height: 10,),
                      createDropTarget(blankPec3!),
                      const SizedBox(height: 10,),
                      createDropTarget(blankPec4!),
                      const SizedBox(height: 10,),
                      createDropTarget(blankPec5!),

                      Divider(),

                      // Expanded(
                      //   flex: 1,
                      //   child:
                      //     ReorderableListView.builder(
                      //     itemCount: listCardPecs.length,
                      //     // Add 1 for the potential dropped item
                      //     itemBuilder: (BuildContext context, int index) {
                      //       // String idStatePec = listCardPecs[index].id.toString();
                      //       // var selectedPec = listCardPecs.where((element) => element.imgFile?.path.split('/').last == idStatePec );
                      //       return listCardPecs[index];
                      //
                      //     },
                      //     onReorder: (oldIndex, newIndex) {
                      //       setState(() {
                      //         if (newIndex > oldIndex) {
                      //           newIndex -= 1;
                      //         }
                      //         final CardPec item = listCardPecs.removeAt(oldIndex);
                      //         listCardPecs.insert(newIndex, item);
                      //       });
                      //     },
                      //   ),
                      // ),
                    ],
                  ),
                ),

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