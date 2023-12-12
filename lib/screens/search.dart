import 'dart:io';

import 'package:app/classes/local_storage.dart';
import 'package:app/classes/pecs_image_provider.dart';
import 'package:app/models/pictograms.dart';
import 'package:app/theme/theme_manager.dart';
import 'package:app/widgets/app_drawer.dart';
import 'package:app/widgets/card_small.dart';
import 'package:app/widgets/list_pecs.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key, required this.themeManager});

  final ThemeManager themeManager;

  @override
  State<StatefulWidget> createState() {
    return _SearchScreen();
  }
}

class _SearchScreen extends State<SearchScreen> {
  TextEditingController textInputController = TextEditingController();
  String searchTerm = '' ;

  void updateSearchTerm(String term) {
    
    if(term.isNotEmpty){
      setState(() {
        searchTerm = term.trim();
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    
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
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 40,
              width: MediaQuery.of(context).size.width - 30,
              child: TextField(
                cursorHeight: 20,
                textInputAction: TextInputAction.search,
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Color.fromARGB(255, 80, 79, 79), width: 1.0),
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Color.fromARGB(255, 199, 199, 199),
                          width: 1.0),
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    hintText: 'Buscar pictogramas',
                    hintStyle: Theme.of(context).textTheme.titleSmall,
                    suffixIcon: const Icon(Icons.search)),
                    
                controller: textInputController,
                onSubmitted: (String value) {
                  debugPrint(value);
                  updateSearchTerm(value);
                },
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            // TextField(controller: textInputController,),
            FutureBuilder<List<Pictograms>>(
              future: getData(searchTerm),
              builder: (context, snapshot) {
                if(searchTerm.isEmpty) {
                  return const Center(
                    child: Text('Busquedas previas'),
                  );
                }
                if (snapshot.hasError) {
                  print('ERROR: $snapshot.error');
                  return const Center(
                    child: Text('Error inesperado!'),
                  );
                } else if (snapshot.hasData) {
                  return Column(children: [
                    Text(
                      'Encontrados: ${snapshot.data!.length}',
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                    const SizedBox(
                      height: 16,
                    ),

                    ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          return Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CardSmall.fromPictogram(snapshot.data![index]),
                                const SizedBox(
                                  height: 16,
                                ),
                              ]);
                        }),
                    // ]),
                  ]);
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

Future<List<Pictograms>> getData(String searchTerm) {
  var fetchPhotos = PecsImageProvider.fetchPhotos(searchTerm);
  print('Catalog: ${fetchPhotos.toString()}');
  return fetchPhotos;
}
