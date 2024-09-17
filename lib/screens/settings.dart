
import 'package:app/classes/pecs_image_provider.dart';
import 'package:app/widgets/app_drawer.dart';
import 'package:flutter/material.dart';


class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ajustes', style: Theme.of(context).textTheme.titleMedium,),
        actions: [
            // IconButton(
            //   icon: const Icon(Icons.notifications),
            //   onPressed: (){},
            // ),
          ],
      ),
      drawer: const MainAppDrawer(),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Divider(),
                    Row(
                      children: [
                        Text('Decargar Pictogramas'),
                        Spacer(),
                        // Boton cargar por defecto, si bdd no tiene pecs
                        //   totalItemsPecsCatalog == 0 ?
                        SizedBox(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 5, bottom: 5),
                            child: TextButton(
                              style: ElevatedButton.styleFrom(
                                foregroundColor: Theme.of(context).cardColor,
                                backgroundColor: Theme.of(context).primaryColor,
                                minimumSize: const Size(88, 30),
                                // padding: const EdgeInsets.symmetric(horizontal: 16),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4.0),
                                ),
                              ),
                              onPressed: () {
                                PecsImageProvider.searchAndSaveBasicPecs(context);
                                // setState(() {
                                //   countPecsInDB().then((value) => totalItemsPecsCatalog = value);
                                //   print('button: $totalItemsPecsCatalog');
                                // });
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 5.0, right: 5.0, top: 1, bottom: 1),
                                child:
                                Text("Catálogo básicos",
                                    style: Theme.of(context).textTheme.labelLarge
                                        ?.copyWith(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ) ,
                        //     : Center(
                        //     child: Text('Tu catálogo tiene ${totalItemsPecsCatalog} PECs descargados',
                        //             style: Theme.of(context).textTheme.labelLarge,)
                        // ),
                        // TextField(controller: textInputController,),
                      ]
                    ),
                  ]
            ),
          ]
        ),

      )
    );
  }

}