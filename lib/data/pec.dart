class Pec {

  Pec.withImage(
   String id,
   String keywords,
   String description,
   String categories,
   String tags,
   String creation,
   String imgUrl ,
   String localImgPath,
  ){
     this.id = id;
     this.keywords = keywords;
     this.description = description;
     this.categories = categories;
     this.tags = tags;
     this.creation = creation;
     this.imgUrl = imgUrl;
     this.localImgPath = localImgPath;
  }

  Pec({
    required this.id,
    required this.keywords,
    required this.description,
    required this.categories,
    required this.tags,
    required this.creation,

  });

   dynamic? id;
   String? keywords;
   String? description;
   String? categories;
   String? tags;
   String? creation;
   String? imgUrl = '';
   String? localImgPath = '';
}