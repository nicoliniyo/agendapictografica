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
  late CardPec blankPec;
  List<File> column1Items = List.empty(growable: true);
  List<CardPec> column2Items = List.empty(growable: true);
  List<int> column3Items = List.generate(3, (index) => (index + 1) * 3);


  loadBlankPec() async {
    var file = await LocalStorage().getImageFileFromAssets('assets/img/blank.png');
    blankPec = CardPec(title: '', imgFile: file);
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
    bool isAccepted = false;

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
      body:
            Row(
              children: [
                Expanded(
                  child: ReorderableListView.builder(
                    itemCount: column1Items.length,
                    itemBuilder: (BuildContext context, int index) {
                      String titleFile = column1Items[index].path.split('/').last;
                      File itemFile = column1Items[index];
                      print(titleFile + ' -> ' + itemFile.path);

                      // Wrap the CardPec with Draggable
                      return Draggable(
                        key: ValueKey(column1Items[index]),
                        //axis: Axis.horizontal,
                        feedback: CardPec(title: titleFile, imgFile: itemFile),
                        child:
                            CardPec(title: titleFile, imgFile: itemFile),


                        childWhenDragging: Opacity(
                          opacity: 0.5,
                          child: CardPec(title: titleFile, imgFile: itemFile),
                        ),
                        // Widget when dragging
                        data: CardPec(title: titleFile, imgFile: itemFile), // Data to identify the item
                      );
                    },
                    onReorder: (oldIndex, newIndex) {
                      setState(() {
                        if (newIndex > oldIndex) {
                          newIndex -= 1;
                        }
                        final File item = column1Items.removeAt(oldIndex);
                        column1Items.insert(newIndex, item);
                      });
                    },
                  ),
                ),
                // Expanded(
                //   child:
                  Column(
                    children: [
                      DragTarget<CardPec>(
                        onWillAccept: (cardPec) {
                          print("WILL ACCEPT " + (cardPec != null).toString());
                          isAccepted = (cardPec != null);
                          return cardPec != null;
                        },
                        onAccept: (CardPec cardPec) {
                          print("OnAccept!");
                          //isAccepted = true;
                        },
                        builder: (BuildContext context, List<CardPec?> candidateData, List<dynamic> rejectedData) {
                          print("IS ACCEPTED: $isAccepted");
                          return isAccepted
                              ? Container(
                            width: 100,
                            height: 100,
                            child:
                              Expanded(
                                flex: 1,
                                child: Column( children: [
                                candidateData.first!,
                                  ]
                                ),
                              ),

                          )

                              : SizedBox(
                              width: 150,
                              height: 150,
                              child: Material(
                                shape: StadiumBorder(),
                                color: Colors.yellow,
                                  )
                              );

                        }),
                    ],
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
                Expanded(
                  child: ListView.builder(
                    itemCount: column3Items.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        title: Text('Column 3 Item ${column3Items[index]}'),
                      );
                    },
                  ),
                ),
              ],
            ),

    );
  }
}


class IndependentScrollableColumns extends StatelessWidget {
  const IndependentScrollableColumns({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Container(
            height: 200, // Adjust the height as needed
            child: Scrollbar(
              child: ListView.builder(
                itemCount: 50,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text('Column 1 Item $index'),
                  );
                },
              ),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
            height: 200, // Adjust the height as needed
            child: Scrollbar(
              child: ListView.builder(
                itemCount: 50,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text('Column 2 Item $index'),
                  );
                },
              ),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
            height: 200, // Adjust the height as needed
            child: Scrollbar(
              child: ListView.builder(
                itemCount: 50,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text('Column 3 Item $index'),
                  );
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}