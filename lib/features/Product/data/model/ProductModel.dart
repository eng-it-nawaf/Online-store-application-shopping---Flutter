class ProductModel {
  dynamic id, price, image,name, description, category, rating, reviews, sizes, inStock;

  ProductModel({
    required this.id,
    required this.price,
    required this.name,
    required this.description,
    required this.category,
    required this.rating,
    required this.reviews,
    required this.image,
    required this.sizes,
    required this.inStock,

  });

  factory ProductModel.fromJson(Map<String, dynamic> product) {
    return ProductModel(
      id: product['id'],
      image:product['image'],
      reviews: product['reviews'],
      price: product['price'],
      name: product['name'],
      description: product['description'],
      category: product['category'],
      rating: product['rating'],
      sizes: product['sizes'],
      inStock: product['inStock'],
    );
  }

  ProductModel fromJson(Map<String, dynamic> json) {
    return ProductModel.fromJson(json);
  }

  factory ProductModel.init() {
    return ProductModel(
        id: '',
        price: '',
        name: '',
        category: '',
        reviews: '',
        description: '',
        rating: '',
        image: '',
        sizes: '',
        inStock: '',
    );
  }

  fromJsonList(List<dynamic> jsonList) {
    List<ProductModel> data = [];
    for (var post in jsonList) {
      data.add(ProductModel.fromJson(post));
    }
    return data;
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'price': price,
    'name': name,
    'reviews': reviews,
    'category': category,
    'description': description,
    'image':image,
    'inStock': inStock,
    'sizes':sizes,
  };
}







// class ProductModel {
//
//   final int id; // تغيير من String إلى int
//   final double price;
//   final String name;
//   final String description;
//   final String category;
//   final double rating;
//   final int reviews;
//   final String image;
//   final List<String> sizes;
//   final bool inStock;
//
//   ProductModel({
//     required this.id,
//     required this.price,
//     required this.name,
//     required this.description,
//     required this.category,
//     required this.rating,
//     required this.reviews,
//     required this.image,
//     required this.sizes,
//     required this.inStock,
//   });
//
//   // تحويل JSON إلى كائن ProductModel
//   factory ProductModel.fromJson(Map<String, dynamic> json) {
//     return ProductModel(
//       id: json['id'] as int,
//       price: json['price'] as double,
//       name: json['name'] as String,
//       description: json['description'] as String,
//       category: json['category'] as String,
//       rating: json['rating'] as double,
//       reviews: json['reviews'] as int,
//       image: json['image'] as String,
//       sizes: List<String>.from(json['sizes']),
//       inStock: json['inStock'] as bool,
//     );
//   }
//
//   // تحويل قائمة JSON إلى قائمة ProductModel
//   static List<ProductModel> fromJsonList(List<dynamic> jsonList) {
//     return jsonList.map((json) => ProductModel.fromJson(json)).toList();
//   }
//
//   // تحويل كائن ProductModel إلى JSON
//   Map<String, dynamic> toJson() {
//     return {
//       'id': id,
//       'price': price,
//       'name': name,
//       'description': description,
//       'category': category,
//       'rating': rating,
//       'reviews': reviews,
//       'image': image,
//       'sizes': sizes,
//       'inStock': inStock,
//     };
//   }
//
//   // إنشاء كائن ProductModel بقيم افتراضية
//   factory ProductModel.init() {
//     return ProductModel(
//       id: 0, // تغيير من '' إلى 0
//       price: 0.0,
//       name: '',
//       description: '',
//       category: '',
//       rating: 0.0,
//       reviews: 0,
//       image: '',
//       sizes: [],
//       inStock: false,
//     );
//   }
// }