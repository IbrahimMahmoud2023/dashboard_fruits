import 'dart:io';

import '../../domain/entites/add_product_input_entity.dart';

class AddProductInputModel {
  final String productName;
  final String description;
  final String productCode;
  final num price;
  final bool isFeatured;
  final File image;

  String? imageUrl;

  AddProductInputModel({
    required this.image,
    required this.productName,
    required this.description,
    required this.productCode,
    required this.price,
    required this.isFeatured,
    String? imageUrl,
  });

  factory AddProductInputModel.fromEntity(
    AddProductInputEntity addProductInputEntity,
  ) {
    return AddProductInputModel(
      image: addProductInputEntity.image,
      productName: addProductInputEntity.productName,
      description: addProductInputEntity.description,
      productCode: addProductInputEntity.productCode,
      price: addProductInputEntity.price,
      isFeatured: addProductInputEntity.isFeatured,
      imageUrl: addProductInputEntity.imageUrl,
    );
  }

  toJson() {
    return {
      'productName': productName,
      'description': description,
      'productCode': productCode,
      'price': price,
      'isFeatured': isFeatured,
      'imageUrl': imageUrl,
    };
  }
}
