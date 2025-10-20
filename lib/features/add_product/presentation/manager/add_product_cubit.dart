import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/repos/image_repo/image_repo.dart';
import '../../../../core/repos/product_repo/product_repo.dart';
import '../../domain/entites/add_product_input_entity.dart';

part 'add_product_state.dart';

class AddProductCubit extends Cubit<AddProductState> {
  final ImageRepo imageRepo;
  final ProductRepo productRepo;
  AddProductCubit(this.imageRepo, this.productRepo)
    : super(AddProductInitial());

  Future<void> addProduct(AddProductInputEntity addProductInputEntity) async {
    emit(AddProductLoading());
    var result = await imageRepo.uploadImage(addProductInputEntity.image);
    result.fold(
      (failure) {
        emit(AddProductFailure(errorMessage: failure.errorMessage));
      },
      (url) async {
        addProductInputEntity.imageUrl = url;
        var result = await productRepo.addProduct(addProductInputEntity);
        result.fold(
          (failure) {
            emit(AddProductFailure(errorMessage: failure.errorMessage));
          },
          (r) {
            emit(AddProductSuccess());
          },
        );
      },
    );
  }
}
