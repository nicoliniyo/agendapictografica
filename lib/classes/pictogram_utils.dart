
import 'package:app/data/pec.dart';
import 'package:app/models/pictograms.dart';

class PictogramUtils {

  static Pec toPec(Pictograms pictogram) {
    List<String> extractedKeywords = [];
    List<String> extractedMeanings = [];
    String kwordsAsStr;
    String meaningsAsStr;
    for (var keywordData in pictogram.keywords) {
      String keyword = keywordData['keyword'];
      String meaning = keywordData['meaning'];
      
      extractedKeywords.add(keyword);
      extractedMeanings.add(meaning);
    }
    kwordsAsStr = extractedKeywords.join(',');
    meaningsAsStr = extractedMeanings.join(',');
    return Pec(
      id: pictogram.id,
      keywords: kwordsAsStr, 
      description: meaningsAsStr,
      creation: DateTime.now());
  }
}