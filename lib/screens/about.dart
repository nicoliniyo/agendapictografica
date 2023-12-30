import 'package:app/data/static_text.dart';
import 'package:app/widgets/app_drawer.dart';
import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Acerca de',
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
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(10),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Expanded(
                    flex: 1,
                    child: Text(
                      StaticText.acercaDe,
                    ),
                  ),
                ]),
                const Divider(),
                Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Expanded(
                    flex: 1,
                    child: Text(
                      StaticText.atribucionArasaac,
                    ),
                  ),
                ]),
                const Divider(),
                Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Expanded(
                    flex: 1,
                    child: Text(
                      StaticText.usoImagenes,
                    ),
                  ),
                ]),
                const Divider(),
                Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Expanded(
                    flex: 1,
                    child: Text(
                      StaticText.licenciaApp,
                    ),
                  ),
                ])
              ]),
        ));
  }
}
