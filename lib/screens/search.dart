
import 'package:app/classes/pecs_image_provider.dart';
import 'package:app/models/pictograms.dart';
import 'package:app/theme/theme_manager.dart';
import 'package:app/widgets/app_drawer.dart';
import 'package:app/widgets/card_item.dart';
import 'package:app/widgets/card_small.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key, required this.themeManager});

  final ThemeManager themeManager;
  
  @override
  Widget build(BuildContext context) {
   return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.search_outlined),
            onPressed: (){},
          )
        ],
      ),
      drawer: const AppDrawer(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            FutureBuilder<List<Pictograms>>(
              future: getData(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return const Center(
                    child: Text('An error has occurred!'),
                  );
                } else if (snapshot.hasData) {
                  return Column(children: [
                      Text('Encontrados: ' + snapshot.data!.length.toString()),
                      PictogramsList(pictogram: snapshot.data!),
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

class PictogramsList extends StatelessWidget {
  const PictogramsList({super.key, required this.pictogram});

  final List<Pictograms> pictogram;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: pictogram.length,
      itemBuilder: (context, index) {
        print(pictogram[index].id.toString());
        return Column(children: [
          CardItem.fromPictogram(pictogram[index]) ,
          const SizedBox(height: 16,),
          CardSmall.fromPictogram(pictogram[index]),
          const SizedBox(height: 16,),
        ]);
      },
    );
  }
}
