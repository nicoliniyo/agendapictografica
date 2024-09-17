
class Pictograms {
   
  final dynamic id;
  final List<dynamic> keywords;
  final bool schematic;
  final bool sex;
  final bool violence;
  final String created;//String($date-time)
  final String lastUpdated; //	String($date-time)
  final int downloads;
  final dynamic categories;
  //final dynamic synsets;
  final dynamic tags;
  //final String desc	;

  const Pictograms({
    required this.id,
    required this.keywords,
    required this.schematic,
    required this.sex,
    required this.violence,
    required this.created,
    required this.lastUpdated,
    required this.downloads,
    required this.categories,
    //required this.synsets,
    required this.tags,
    //required this.desc
  });

  factory Pictograms.fromJson(Map<String, dynamic> json) {
    //print('JSON $json');
    return Pictograms(
      id: json['_id'] as dynamic,
      keywords: json['keywords'] as List<dynamic>,
      schematic: json['schematic'] as bool,
      sex: json['sex'] as bool,
      violence: json['violence'] as bool,
      created: json['created'] as String,
      lastUpdated: json['lastUpdated'] as String,
      downloads: json['downloads'] as int,
      categories: json['categories'] as dynamic,
      //synsets: json['synsets'] as dynamic,
      tags: json['tags'] as dynamic,
      //desc: json['desc'] as String,
    );
  }


}

class Keyword{
  const Keyword(
    this.idKeyword,
    this.keyword,
    this.plural,
    this.idLocution,
    this.meaning,
    this.type,
    this.lse
  );
final int idKeyword;
final String keyword;	
final String plural;
final String idLocution;
final String meaning;
final int type;	
final int lse;

}