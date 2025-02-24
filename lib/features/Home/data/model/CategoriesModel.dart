class CategoriesModel {
  dynamic id,image,description,name;

  CategoriesModel({
    required this.id,
    required this.image,
    required this.description,
    required this.name,


  });

  factory CategoriesModel.fromJson(Map<String, dynamic> Carousel) {
    return CategoriesModel(
      id: Carousel['id'],
      image:Carousel['image'],
      name: Carousel['name'],
      description:Carousel['description'],
    );
  }

  CategoriesModel fromJson(Map<String, dynamic> json) {
    return CategoriesModel.fromJson(json);
  }

  factory CategoriesModel.init() {
    return CategoriesModel(
        id: '',
        image: '',
        name: '',
      description: '',
    );
  }

  fromJsonList(List<dynamic> jsonList) {
    List<CategoriesModel> data = [];
    for (var post in jsonList) {
      data.add(CategoriesModel.fromJson(post));
    }
    return data;
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'image':image,
    'name': name,
    'description':description,
  };
}



