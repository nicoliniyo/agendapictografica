import 'package:app/classes/pecs_url_builder.dart';
import 'package:app/classes/pictogram_utils.dart';
import 'package:app/classes/string_capitalize_extension.dart';
import 'package:app/data/pec.dart';
import 'package:app/models/pictograms.dart';
import 'package:flutter/material.dart';

class CardSmall extends StatelessWidget {

  CardSmall.fromPictogram(Pictograms pictogram, {super.key}){
    Pec pecObj = PictogramUtils.toPec(pictogram);
    id = pecObj.id;
    title = pecObj.keywords;
    description = pecObj.description;
    imgUrl = PecsUrlBuilder().pictograms(pecObj.id.toString());
    tap = (){};
  }

  CardSmall(
      {
        super.key,
        this.id,
        this.title,
        this.description,
        this.imgUrl,
        this.tap
       });

  int? id;
  String? description;
  String? imgUrl;
  Function? tap;
  String? title;


 

  @override
  Widget build(BuildContext context) {
    return Card(
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
                                title!,
                                style: Theme.of(context).textTheme.titleLarge,
                              ),
                              Text(
                                description!,
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
                                imgUrl!,
                                width: 150,
                              ),
                              Text(
                                title!.capitalize(),
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
                        Row(
                          children: [
                            Icon(Icons.image_outlined),
                            SizedBox(width: 8),
                            Icon(Icons.check_circle_outline_outlined),
                            //IconsStacked(main: Icons.image_outlined, helper: Icons.check_circle_rounded),
                            SizedBox(width: 8),
                            Icon(Icons.cloud_download_outlined),
                            SizedBox(width: 8),
                            Icon(Icons.delete_outline_outlined),
                          ],
                        ),
                        Spacer(),
                        Row(
                          children: [
                            Icon(Icons.list_outlined),
                                                        
                            SizedBox(width: 8),
                            Icon(Icons.star_border_outlined),
                            
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
  }
}
