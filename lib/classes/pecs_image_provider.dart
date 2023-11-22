

import 'dart:convert';
import 'dart:io';

import 'package:app/models/pictograms.dart';
import 'package:http/http.dart' as http;

class PecsImageProvider {

static List<Pictograms> parsePhotos(String responseBody) {
  final parsed =
      (jsonDecode(responseBody) as List).cast<Map<String, dynamic>>();

  return parsed.map<Pictograms>((json) => Pictograms.fromJson(json)).toList();
}

static Future<List<Pictograms>> fetchPhotos() async {
  final response = await 
      http.get(Uri.parse('https://api.arasaac.org/api/pictograms/es/bestsearch/uno'));

  // Use the compute function to run parsePhotos in a separate isolate.
  return parsePhotos(response.body);
}

}