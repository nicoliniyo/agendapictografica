import 'package:app/classes/pecs_image_provider.dart';
import 'package:app/models/pictograms.dart';
import 'package:app/theme/theme_manager.dart';
import 'package:app/widgets/app_drawer.dart';
import 'package:app/widgets/card_item.dart';
import 'package:app/widgets/card_small.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key, required this.themeManager});

  final ThemeManager themeManager;

  @override
  State<StatefulWidget> createState() {
    return _SearchScreen();
  }
}

class _SearchScreen extends State<SearchScreen> {
  bool typing = false;

  @override
  Widget build(BuildContext context) {
    TextEditingController textInputController = TextEditingController();
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
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 40,
              child: TextField(
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Color.fromARGB(255, 80, 79, 79), width: 1.0),
                          borderRadius: BorderRadius.circular(30.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Color.fromARGB(255, 199, 199, 199), width: 1.0),
                          borderRadius: BorderRadius.circular(30.0),
                    ),
                    hintText: 'Buscar',
                    hintStyle: Theme.of(context).textTheme.titleSmall,
                    suffixIcon: const Icon(Icons.search)),
                    
                controller: textInputController,
                onSubmitted: (String value) {
                  debugPrint(value);
                },
              ),
            ),
            const SizedBox(height: 16,),
            // TextField(controller: textInputController,),
            FutureBuilder<List<Pictograms>>(
              future: getData(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return const Center(
                    child: Text('An error has occurred!'),
                  );
                } else if (snapshot.hasData) {
                  return Column(children: [
                    Text('Encontrados: ${snapshot.data!.length}', style: Theme.of(context).textTheme.labelLarge,),
                    const SizedBox(height: 16,),
                    //PictogramsList(pictogram: snapshot.data!),
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        print(snapshot.data![index].id.toString());
                        return Column(children: [
                          // CardItem.fromPictogram(snapshot.data![index]),
                          // const SizedBox(
                          //   height: 16,
                          // ),
                          CardSmall.fromPictogram(snapshot.data![index]),
                          const SizedBox(
                            height: 16,
                          ),
                        ]);
                      },
                    ),
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

Future<List<Pictograms>> getData() {
  var fetchPhotos = PecsImageProvider.fetchPhotos();
  print('FETCHED FOTOS: $fetchPhotos');
  return fetchPhotos;
}
