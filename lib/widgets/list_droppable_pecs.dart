import 'package:app/classes/local_storage.dart';
import 'package:app/widgets/card_pec.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class ListDroppablePec extends StatefulWidget {
  const ListDroppablePec({super.key});

  @override
  State<ListDroppablePec> createState() {
    return _ListDroppablePec();
  }
}

class _ListDroppablePec extends State<ListDroppablePec> {
  late CardPec blankPec;
  var uuid = const Uuid();

  void loadBlankPec() async {
    var file = await LocalStorage().getImageFileFromAssets('assets/img/blank.png');
    blankPec = CardPec(title: '', imgFile: file);
  }

  DragTarget makeDroppable(CardPec cardPec) {
   return  DragTarget<CardPec>(
     key: ValueKey(uuid.v4()),
     onAccept: (CardPec cardPec) {
          debugPrint("On acept!");
          // setState(() {
          //   // Find the index of dropped item in column1Items
          //   final int dataIndex = column1Items.indexOf(data);
          //   if (dataIndex != -1) {
          //     column2Items.add(CardPec(title: '', imgFile: data)); // Add the dropped item
          //     column1Items.removeAt(dataIndex); // Remove it from the first column
          //   }
          // }
        },
     builder: (BuildContext context, List<CardPec?> candidateData, List<dynamic> rejectedData) {
       print("BLANC_PEC: ${blankPec.toString()}");
       return blankPec;
      },
   );
  }

  @override
  void initState() {
    super.initState();
    loadBlankPec();
  }

  @override
  Widget build(BuildContext context) {
    List list = List.empty(growable: true);
    list.add(blankPec);
    list.add(blankPec);
    list.add(blankPec);
    list.add(blankPec);
    list.add(blankPec);

    return ListView.builder(
      shrinkWrap: true,
      itemCount: list.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: makeDroppable(list[index]),
        );
      },
    );

  }
}