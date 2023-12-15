import 'package:app/classes/pecs_image_provider.dart';
import 'package:app/classes/pecs_url_builder.dart';
import 'package:app/models/pictograms.dart';
import 'package:app/widgets/app_drawer.dart';
import 'package:app/widgets/card_item.dart';
import 'package:app/widgets/card_small.dart';
import 'package:flutter/material.dart';

var lorem = '''Lorem Ipsum is simply dummy text of the printing and typesetting industry. 

Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.
''';
class DesignSystem extends StatelessWidget {
  // const DesignSystem({super.key, required this.themeManager});
  const DesignSystem({super.key});

  // final ThemeManager themeManager;
  

  @override
  Widget build(BuildContext context) {
    

    return Scaffold(
      appBar: AppBar(
        // actions: [
        //   Switch(
        //     value: (themeManager.themeMode == ThemeMode.dark ? true : false),
        //     onChanged: (newValue) {
        //         themeManager.toggleTheme(newValue);
        //       }
        //     ),
        //   ],
      ),
      drawer: const MainAppDrawer(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Headline Large', style: Theme.of(context).textTheme.headlineLarge!,),
            Text('Headline Medium', style: Theme.of(context).textTheme.headlineMedium!,),
            Text('Headline Small', style: Theme.of(context).textTheme.headlineSmall!,),
            Text('Tittle Large', style: Theme.of(context).textTheme.titleLarge!,),
            Text('Tittle Medium', style: Theme.of(context).textTheme.titleMedium!,),
            Text('Tittle Small', style: Theme.of(context).textTheme.titleSmall!,),
            Text('Label Large', style: Theme.of(context).textTheme.labelLarge!,),
            Text('Label Medium', style: Theme.of(context).textTheme.labelMedium!,),
            Text('Label Small', style: Theme.of(context).textTheme.labelSmall!,),
            Text('Body Large', style: Theme.of(context).textTheme.bodyLarge!,),
            Text('Body Medium', style: Theme.of(context).textTheme.bodyMedium!,),
            Text('Body Small', style: Theme.of(context).textTheme.bodySmall!,),
            const SizedBox(height: 16,),
            //Text(lorem, style: Theme.of(context).textTheme.bodyLarge!, textAlign: TextAlign.justify,),
            OutlinedButton(
              onPressed: (){}
            , child: const Text('Select')),
            const SizedBox(height: 16,),
            // OutlinedButton(
            //     onPressed: (){},
            //   child: const Text('Select'),
            // ),
            // const SizedBox(height: 16,),
            // OutlinedButton(
            //     onPressed: (){}
            //     , child: const Text('Select')),
            // const SizedBox(height: 16,),
            // OutlinedButton(
            //     onPressed: (){}
            //     , child: const Text('Select')),
            // const SizedBox(height: 16,),
            CardSmall(
              title: 'hola',
              description: 'Se emplea como saludo familiar',
              imgUrl: PecsUrlBuilder().pictograms('6009'),
              tap: () {},
            ),
            const SizedBox(height: 16,),
            CardItem(
              title: 'hola',
              description: 'Se emplea como saludo familiar',
              imgUrl: PecsUrlBuilder().pictograms('6009'),
              tap: () {},
            ),
            const SizedBox(height: 16,),
            CardItem(
              title: 'hola',
              description: 'Se emplea como saludo familiar',
              imgUrl: PecsUrlBuilder().pictograms('6010'),
              tap: () {},
            ),
            const SizedBox(height: 16,),
            CardItem(
              title: 'hola',
              description: 'Se emplea como saludo familiar',
              imgUrl: PecsUrlBuilder().pictograms('6011'),
              tap: () {},
            ),
            const SizedBox(height: 16,),
            const Divider(),
            const Text('Search Arasaac API:'),
            Text(PecsUrlBuilder().pictograms('6009')),
            Text(PecsUrlBuilder().bestsearch('biberon')),
            const Divider(),
            //SeachField(),
            
            

            //Esto esta en buscar SearchScreen
            // FutureBuilder<List<Pictograms>>(
            //   future: getData(),
            //   builder: (context, snapshot) {
            //     if (snapshot.hasError) {
            //       return const Center(
            //         child: Text('An error has occurred!'),
            //       );
            //     } else if (snapshot.hasData) {
            //       return Column(children: [
            //           Text('Tamanio: ' + snapshot.data!.length.toString()),
            //           PictogramsList(pictogram: snapshot.data!),
            //         ]);
            //     } else {
            //       return const Center(
            //         child: CircularProgressIndicator(),
            //       );
            //     }
            //   },
            // ),

            
        ],
        ),
      ),
    );
  }
}

Future<List<Pictograms>> getData() {
  var fetchPhotos = PecsImageProvider.fetchPhotos('uno');
  // print('FETCHED FOTOS: $fetchPhotos');
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

class SeachField extends StatelessWidget {
  const SeachField({super.key});
  
  @override
  Widget build(BuildContext context) {
    return  
              const Expanded(
               // width: 40,
                child: Row( children: [
                  TextField(),
                  //Spaiconcer(),
                  Icon(Icons.search),
                           ]
                          // )
                  ),
              );
  }


}
