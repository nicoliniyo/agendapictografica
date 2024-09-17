class PecsUrlBuilder {

  final String api = 'https://api.arasaac.org/api/';
  final String bestSearchPath = 'bestsearch/';
  final String lang = 'es/';
  final String pictogramsQparams = '?url=false&download=false';
  final String pictogramasPath = 'pictograms/';
  final String v1 = 'https://api.arasaac.org/v1/';

  

  String get apiHost {
    return api; 
  }

  String get language {
    return lang;
  }

  //'https://api.arasaac.org/api/pictograms/es/bestsearch/biberon'
  String bestsearch(String searchTerm) {
    
    return '$api$pictogramasPath$lang$bestSearchPath$searchTerm';
  }

  //'https://api.arasaac.org/v1/pictograms/6009?url=false&download=false' hola
  String pictograms(String pictogramId) {
    return '$v1$pictogramasPath$pictogramId$pictogramsQparams';
  }

  //GET "https://api.arasaac.org/api/pictograms/es/2627"
  String pictogramsMetadata(String pictogramId) {
    return  '$api$pictogramasPath$lang$pictogramId';
  }
}