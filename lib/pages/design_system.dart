import 'package:app/theme/theme_manager.dart';
import 'package:app/widgets/app_drawer.dart';
import 'package:flutter/material.dart';
import 'package:app/theme/custom_theme.dart';

import '../widgets/card_small.dart';

var lorem = '''Lorem Ipsum is simply dummy text of the printing and typesetting industry. 

Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.
''';
class DesignSystem extends StatelessWidget {
  const DesignSystem({super.key, required this.themeManager});

  final ThemeManager themeManager;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [Switch(value: themeManager.themeMode == ThemeMode.dark
        , onChanged: (newValue) {
          themeManager.toggleTheme(newValue);
        })],
      ),
      drawer: const AppDrawer(),
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
            Container(child: Card(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 16,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'hola',
                                style: Theme.of(context).textTheme.titleLarge,
                              ),
                              const Text(
                                'interj. Se emplea como saludo familiar.',
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.network(
                                'https://api.arasaac.org/v1/pictograms/6009?url=false&download=false',
                                width: 150,
                              ),
                              Text(
                                'Imagen',
                                style: Theme.of(context).textTheme.titleSmall,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    const Row(
                      children: [
                        Text(
                          'Descripcion',
                        ),
                        Spacer(),
                        Row(
                          children: [
                            Icon(Icons.download),
                            SizedBox(width: 8),
                            Icon(Icons.image_outlined),
                            SizedBox(width: 8),
                            Icon(Icons.download_done_rounded),
                            SizedBox(width: 8),
                            Icon(Icons.delete_outline_outlined),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            ),
        ],
        ),
      ),
    );
  }
}
