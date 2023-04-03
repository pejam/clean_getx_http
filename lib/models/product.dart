import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class Product {
  const Product({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rating,
  });

  final int id;
  final String title;
  final double price;
  final String description;
  final String category;
  final String image;
  final Rating rating;

  factory Product.fromJson(Map<String,dynamic> json) => Product(
    id: json['id'] as int,
    title: json['title'].toString(),
    price: (json['price'] as num).toDouble(),
    description: json['description'].toString(),
    category: json['category'].toString(),
    image: json['image'].toString(),
    rating: Rating.fromJson(json['rating'] as Map<String, dynamic>)
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'price': price,
    'description': description,
    'category': category,
    'image': image,
    'rating': rating.toJson()
  };

/*
  Product clone() => Product(
    id: id,
    title: title,
    price: price,
    description: description,
    category: category,
    image: image,
    rating: rating.clone()
  );


  Product copyWith({
    int? id,
    String? title,
    double? price,
    String? description,
    String? category,
    String? image,
    Rating? rating
  }) => Product(
    id: id ?? this.id,
    title: title ?? this.title,
    price: price ?? this.price,
    description: description ?? this.description,
    category: category ?? this.category,
    image: image ?? this.image,
    rating: rating ?? this.rating,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is Product && id == other.id && title == other.title && price == other.price && description == other.description && category == other.category && image == other.image && rating == other.rating;

  @override
  int get hashCode => id.hashCode ^ title.hashCode ^ price.hashCode ^ description.hashCode ^ category.hashCode ^ image.hashCode ^ rating.hashCode;
  */
}

@JsonSerializable()
class Rating {
  const Rating({
    required this.rate,
    required this.count,
  });

  final double rate;
  final int count;

  factory Rating.fromJson(Map<String,dynamic> json) => Rating(
    rate: (json['rate'] as num).toDouble(),
    count: json['count'] as int
  );

  Map<String, dynamic> toJson() => {
    'rate': rate,
    'count': count
  };

  /*

  Rating clone() => Rating(
    rate: rate,
    count: count
  );


  Rating copyWith({
    double? rate,
    int? count
  }) => Rating(
    rate: rate ?? this.rate,
    count: count ?? this.count,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is Rating && rate == other.rate && count == other.count;

  @override
  int get hashCode => rate.hashCode ^ count.hashCode;
  */
}
