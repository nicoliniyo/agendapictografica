

import 'dart:convert';

import 'package:app/models/pictograms.dart';
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

}