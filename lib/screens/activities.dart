import 'dart:io';

import 'package:app/classes/local_storage.dart';
import 'package:app/widgets/app_drawer.dart';
import 'package:app/widgets/card_pec.dart';
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
  List<File> column1Items = List.empty();
  final List<int> column2Items = List.generate(3, (index) => (index + 1) * 2);
  final List<int> column3Items = List.generate(3, (index) => (index + 1) * 3);

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
  }
  
  @override
  Widget build(BuildContext context)  {
    
  
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Buscar',
          style: Theme.of(context).textTheme.titleLarge,
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
      body: Row(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: column1Items.length,
            itemBuilder: (BuildContext context, int index) {
              String titleFile  = column1Items[index].path.split('/').last;
              File itemFile = column1Items[index];
              print(titleFile + ' -> ' + itemFile.path);
              CardPec card = CardPec(title: titleFile, imgFile: itemFile);
              return Column(
                children: [
                  card,
                  const SizedBox(height: 10,)
                ],
              );
            },
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: column2Items.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                
                title: Text('Column 2 Item ${column2Items[index]}'),
              );
            },
          ),
        ),
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