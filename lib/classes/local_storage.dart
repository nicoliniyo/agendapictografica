import 'dart:io';

import 'package:app/classes/pecs_url_builder.dart';
import 'package:app/classes/pictogram_utils.dart';
import 'package:app/models/pictograms.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart' as syspaths;

class LocalStorage {

  /// imageUrl and targetFilename to File and save it to getApplicationDocumentsDirectory.
  /// File final name is getApplicationDocumentsDirectory/targetFileName.png
  Future<void> copyImageToLocal(String imageUrl, String targetFileName) async {
    final response = await http.get(Uri.parse(imageUrl));
    final documentDirectory = await syspaths.getApplicationDocumentsDirectory();
    final file = File('${documentDirectory.path}/$targetFileName.png');
    if(file.existsSync()){
      print('File Exists: ${documentDirectory.path}/$targetFileName.png');
    } else {
      print('Writing TargetFilename: ${documentDirectory.path}/$targetFileName.png');
      await file.writeAsBytes(response.bodyBytes);
    }
    //setState(() {});
  }

/// Pictograms imageUrl to File and save it to getApplicationDocumentsDirectory.
/// File final name is getApplicationDocumentsDirectory/{pictogram.id}.png
/// Example 4321.png
  Future<void> copyPictogramImageToLocal(Pictograms pictogram) async {
    LocalStorage().copyImageToLocal(
      PecsUrlBuilder().pictograms(PictogramUtils.toPec(pictogram).id.toString()),
      pictogram.id.toString()
    );
  }

  Future<List<File>> listPngFiles() async {
    List<File> pngFiles = [];
    final documentDirectory = await syspaths.getApplicationDocumentsDirectory();
    
      return pngFiles = documentDirectory
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