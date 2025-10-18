import 'dart:io';

class AddProductInputEntity {
  final String productName;
  final String description;
  final String productCode;
  final num price;
  final bool isFeatured;
  final File image;

  final String? imageUrl;

  AddProductInputEntity({
    required this.image,
    required this.productName,
    required this.description,
    required this.productCode,
    required this.price,
    required this.isFeatured,
    this.imageUrl,
  });
}
