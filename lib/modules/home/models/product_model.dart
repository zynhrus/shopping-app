import 'package:fit_hub_project/main.library.dart';

part 'product_model.g.dart';

@JsonSerializable()
class ProductModel {
  int id;
  String title;
  String description;
  int price;
  double discountPercentage;
  double rating;
  int stock;
  String brand;
  String category;
  String thumbnail;
  List<String> images;

  ProductModel({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.brand,
    required this.discountPercentage,
    required this.images,
    required this.price,
    required this.rating,
    required this.stock,
    required this.thumbnail,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductModelToJson(this);
}
