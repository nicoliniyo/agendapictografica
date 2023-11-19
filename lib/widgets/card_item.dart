import 'package:app/classes/string_capitalize_extension.dart';
import 'package:app/theme/custom_theme.dart';
import 'package:app/widgets/icons_stacked.dart';
import 'package:flutter/material.dart';

class CardItem extends StatelessWidget {
  CardItem(
      {
        super.key,
        required this.title,
        required this.description,
        required this.imgUrl,
        required this.tap
       });

  final String description;
  final String imgUrl;
  final Function tap;
  final String title;

 

  @override
  Widget build(BuildContext context) {
    return Card(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 8,
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
                                title,
                                style: Theme.of(context).textTheme.titleLarge,
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
                                // 'https://api.arasaac.org/v1/pictograms/6009?url=false&download=false',
                                imgUrl,
                                width: 50,
                              ),
                              
                            ],
                          ),
                        ),
                        const Expanded(
                          flex: 1,
                          child: 
                          Row(
                          children: [
                            Spacer(),
                            Icon(Icons.list_outlined),               
                            SizedBox(width: 8),
                            Icon(Icons.star_border_outlined),
                            
                          ],
                        ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            );
  }
}
