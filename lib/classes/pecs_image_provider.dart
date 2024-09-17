

import 'dart:convert';

import 'package:app/classes/local_storage.dart';
import 'package:app/classes/pecs_url_builder.dart';
import 'package:app/classes/pictogram_utils.dart';
import 'package:app/classes/screen_messages.dart';
import 'package:app/data/pec.dart';
import 'package:app/models/pictograms.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class PecsImageProvider {

static List<Pictograms> parsePhotos(String responseBody) {
  final parsed = jsonDecode(responseBody);
  if (parsed is List) {
    // Parse the list of maps
    return parsed.cast<Map<String, dynamic>>().map<Pictograms>((json) => Pictograms.fromJson(json)).toList();
  } else {
    // Handle the case where the response is a single map
    return [Pictograms.fromJson(parsed as Map<String, dynamic>)];
  }
}

static Future<List<Pictograms>> fetchPhotos(String searchTerm) async {
  final response = await 
      http.get(Uri.parse('https://api.arasaac.org/api/pictograms/es/search/$searchTerm'));

  // Use the compute function to run parsePhotos in a separate isolate.
  return parsePhotos(response.body);
}

static Future<Pictograms> getPictogram(String pictogramId) async {
  final response = await
  http.get(Uri.parse(PecsUrlBuilder().pictogramsMetadata(pictogramId)));
  final parsed = jsonDecode(response.body);
  //print(parsed);
  return Pictograms.fromJson(parsed as Map<String, dynamic>);
}

  static updatePecAndSave(String imgUrl, String id, Pec pec, BuildContext context, snackBarMessage)  async {
    //Save img in local
    LocalStorage().copyImageToLocal(imgUrl, id);
    //Update local pecObject with local path of image
    await LocalStorage().createImageToLocalPath(imgUrl, id.toString())
        .then((value) => pec.localImgPath = value);

    //Save to DB
    //try {
    await LocalStorage().savePecToDb(pec)
        .then((value) => debugPrint('SAVED_TO_DB: $value, PEC.id: ${pec.id.toString()}'));
    // catch (DatabaseException error) {
    // Unhandled Exception: DatabaseException(UNIQUE constraint failed: pecs.id (code 1555 SQLITE_CONSTRAINT_PRIMARYKEY))
    // }
    //_snackBarMessage("${pec!.keywords} guardado con exito!", context);
    snackBarMessage;
  }

  static searchAndSave(String id, BuildContext context)  async {
  // obtain imgUrl
    //String pictogramUrl = PecsUrlBuilder().pictograms(id.toString());

     var pictograms = await getPictogram(id);
     var pec = PictogramUtils.toPec(pictograms);
     String imgUrl = PecsUrlBuilder().pictograms(id);
     pec.imgUrl = imgUrl; //pec needs update of imgUrl
     //print("searchAndSave IMG_URL: $imgUrl");
  //Save img in local
    LocalStorage().copyImageToLocal(imgUrl, id);
    //Update local pecObject with local path of image
    await LocalStorage().createImageToLocalPath(imgUrl, id.toString())
        .then((value) => pec.localImgPath = value);

    //Save to DB
    //try {
    await LocalStorage().savePecToDb(pec)
        .then((value) => debugPrint('SAVED_TO_DB: $value, PEC.id: ${pec.id.toString()}'));
    // catch (DatabaseException error) {
    // Unhandled Exception: DatabaseException(UNIQUE constraint failed: pecs.id (code 1555 SQLITE_CONSTRAINT_PRIMARYKEY))
    // }
    //_snackBarMessage("${pec!.keywords} guardado con exito!", context);
    //snackBarMessage;
  }

  static searchAndSaveBasicPecs(BuildContext context) {
    List<String> ids = [
      '7027',
      '32798',
      '32940',
      '38265',
      '27321',
      '31048',
      '31378',
      '4768',
      '10227',
      '8653',
      '7201',
      '33954',
      '37687',
      '3429',
      '31892',
      '15507',
      '2931',
      '2264',
      '5968',
      '7207',
      '8508',
      '25498',
      '29124',
      '33064',
      '4935',
      '35434',
      '32554',
      '24791',
      '2616',
      '23897'];
    for (var element in ids) {
      searchAndSave(element, context);
      debugPrint('Fetching pec: $element');
     }
    ScreenMessages.snackBarMessage('${ids.length} Pictogramas básicos descargados!', context);

  }
}