import 'dart:io';

import 'package:fruits_hub_dashboard/features/add_product/data/models/review_model.dart';
import 'package:fruits_hub_dashboard/features/add_product/domain/entites/review_entity/review_entity.dart';

import '../../domain/entites/add_product_input_entity.dart';

class AddProductInputModel {
  final String productName;
  final String description;
  final String productCode;
  final num price;
  final bool isFeatured;
  final File image;

  String? imageUrl;

  final int expirationsOfMonths;
  final bool isOrganic;
  final int numberOfCalories;
  final int unitsAmount;

  final num avgRating = 0;
  final num countRating = 0;
  final List<ReviewModel> reviews;

  AddProductInputModel({
    required this.reviews,
    required this.expirationsOfMonths,
     this.isOrganic = false,
    required this.numberOfCalories,
    required this.unitsAmount,
    required this.image,
    required this.productName,
    required this.description,
    required this.productCode,
    required this.price,
    required this.isFeatured,
    this.imageUrl,
  });

  factory AddProductInputModel.fromEntity(
    AddProductInputEntity addProductInputEntity,
  ) {
    return AddProductInputModel(
      reviews:  addProductInputEntity.reviews.map((e) => ReviewModel.fromEntity(e)).toList(),
      expirationsOfMonths: addProductInputEntity.expirationsOfMonths,
      isOrganic: addProductInputEntity.isOrganic,
      numberOfCalories: addProductInputEntity.numberOfCalories,
      unitsAmount: addProductInputEntity.unitsAmount,
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
      'expirationsOfMonths': expirationsOfMonths,
      'isOrganic': isOrganic,
      'numberOfCalories': numberOfCalories,
      'unitsAmount': unitsAmount,
      'productName': productName,
      'description': description,
      'productCode': productCode,
      'price': price,
      'isFeatured': isFeatured,
      'imageUrl': imageUrl,
      'reviews': reviews.map((e) => e.toJson()).toList(),
    };
  }
}
