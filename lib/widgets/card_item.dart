import 'package:app/classes/pecs_url_builder.dart';
import 'package:app/classes/pictogram_utils.dart';
import 'package:app/data/pec.dart';
import 'package:app/models/pictograms.dart';
import 'package:flutter/material.dart';

class CardItem extends StatelessWidget {
  CardItem.fromPictogram(Pictograms pictogram){
    Pec pecObj = PictogramUtils.toPec(pictogram);
    print("PEC: " + pecObj.toString());
    id = pecObj!.id;
    title = pecObj!.keywords;
    description = pecObj!.description;
    imgUrl = PecsUrlBuilder().pictograms(pecObj!.id.toString());
    tap = (){};
  }
  
  CardItem(
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
                                title!,
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
                                imgUrl!,
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
