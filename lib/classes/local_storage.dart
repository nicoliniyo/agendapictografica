import 'dart:io';

import 'package:app/classes/database_provider.dart';
import 'package:app/classes/pecs_url_builder.dart';
import 'package:app/classes/pictogram_utils.dart';
import 'package:app/data/pec.dart';
import 'package:app/models/pictograms.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart' as syspaths;

class LocalStorage {

  Future<String> createImageToLocalPath(String imageUrl, String targetFileName) async {
    final documentDirectory = await syspaths.getApplicationDocumentsDirectory();
    final filePath = '${documentDirectory.path}/$targetFileName.png';
    return filePath;
  }

  /// imageUrl and targetFilename to File and save it to getApplicationDocumentsDirectory.
  /// File final name is getApplicationDocumentsDirectory/targetFileName.png
  Future<void> copyImageToLocal(String imageUrl, String targetFileName) async {
    final response = await http.get(Uri.parse(imageUrl));
    //final documentDirectory = await syspaths.getApplicationDocumentsDirectory();
    var pathAndFilename = await createImageToLocalPath(imageUrl, targetFileName);
    final file = File(pathAndFilename);
    if(file.existsSync()){
      print('File Exists: $pathAndFilename');
    } else {
      print('Writing TargetFilename: ${pathAndFilename}');
      await file.writeAsBytes(response.bodyBytes);
    }
    //setState(() {});
  }

/// Pictograms imageUrl to File and save it to getApplicationDocumentsDirectory.
/// File final name is getApplicationDocumentsDirectory/{pictogram.id}.png
/// Example 4321.png
  Future<void> copyPictogramImageToLocal(Pictograms pictogram) async {
    var pec = PictogramUtils.toPec(pictogram);
    print("PEC: $pec");
    LocalStorage().copyImageToLocal(
      PecsUrlBuilder().pictograms(pec.id.toString()),
      pictogram.id.toString()
    );
  }

  Future<int> savePecToDb(Pec pec) async {

    print("copyPecToDb:");
    debugPrint("PEC.id: ${pec.id.toString()}");
    debugPrint("PEC.imgUrl: ${pec.imgUrl}");
    debugPrint("PEC.localImgPath: ${pec.localImgPath}");
    var db = await DatabaseProvider().getDatabase();
    return db.insert('pecs', {
      'id': pec.id,
      'keywords': pec.keywords,
      'description': pec.description,
      'categories': pec.categories,
      'tags': pec.tags,
      'creation': pec.creation,
      'imgUrl': pec.imgUrl,
      'localImgPath' : pec.localImgPath,
    });


  }

  Future<List<File>> listPngFiles() async {
    final documentDirectory = await syspaths.getApplicationDocumentsDirectory();
    return documentDirectory
        .listSync()
        .where((file) => file is File && file.path.endsWith('.png'))
        .toList()
        .cast<File>();
  }

  Future<File> getImageFileFromAssets(String path) async {
    final byteData = await rootBundle.load(path);

    final file = File('${(await syspaths.getApplicationDocumentsDirectory()).path}/$path');
    await file.create(recursive: true);
    await file.writeAsBytes(byteData.buffer.asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));

    return file.absolute;
  }

}