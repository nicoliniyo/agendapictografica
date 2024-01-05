import 'package:app/classes/pecs_image_provider.dart';
import 'package:app/models/pictograms.dart';
import 'package:app/widgets/app_drawer.dart';
import 'package:app/widgets/card_small.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _SearchScreen();
  }
}

class _SearchScreen extends State<SearchScreen> {
  TextEditingController textInputController = TextEditingController();
  String searchTerm = '' ;
  // int totalItemsPecsCatalog = 0;

  void updateSearchTerm(String term) {
    
    if(term.isNotEmpty){
      setState(() {
        searchTerm = term.trim();
      });
    }
  }

  // Future<int> countPecsInDB() async {
  //   var count = await DatabaseProvider().totalItemsCatalog();
  //   print("countPecsInDB: $count");
  //   //print("totalItemsPecsCatalog: $totalItemsPecsCatalog");
  //   return count;
  // }

  // @override
  // void initState() {
  //   countPecsInDB().then((value) => totalItemsPecsCatalog = value);
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Buscar',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        actions: [
          // IconButton(
          //   icon: const Icon(Icons.notifications),
          //   onPressed: () {},
          // ),
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
              height: 48,
              width: MediaQuery.of(context).size.width - 30,
              child: Semantics(
                label: 'Buscar pictogramas',
                child: TextField(
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
                    hintStyle: Theme.of(context).textTheme.titleSmall!.copyWith(color: const Color.fromRGBO(154, 154, 154, 1.0)),
                    //label: const Text('Buscar pictogramas'),
                    suffixIcon: const Icon(Icons.search)),
                    
                controller: textInputController,
                onSubmitted: (String value) {
                  debugPrint(value);
                  updateSearchTerm(value);
                },
               ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            MergeSemantics(
              child: FutureBuilder<List<Pictograms>>(
              future: getData(searchTerm),
              builder: (context, snapshot) {
                if(searchTerm.isEmpty) {
                  return const Text("Introduzca término a buscar", style: TextStyle(fontSize: 14.0));
                }
                if (snapshot.hasError) {
                  debugPrint('ERROR: $snapshot.error');
                  return Center(
                    child: Text('Error inesperado! ${snapshot.error}'),
                  );
                } else if (snapshot.hasData) {
                  return Column(children: [
                    snapshot.data!.length != 0 ?
                    Text(
                      'Encontrados: ${snapshot.data!.length}',
                      style: Theme.of(context).textTheme.labelLarge,
                    ) :
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
                  ]);
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
            ),
          ],
        ),
      ),
    );
  }
}

Future<List<Pictograms>> getData(String searchTerm) {
  if(searchTerm.isEmpty) return Future.value(List.empty(growable: true));
  var fetchPhotos = PecsImageProvider.fetchPhotos(searchTerm);
  return fetchPhotos;
}
