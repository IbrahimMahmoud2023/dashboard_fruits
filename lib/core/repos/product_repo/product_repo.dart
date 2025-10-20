import 'package:dartz/dartz.dart';

import '../../../features/add_product/domain/entites/add_product_input_entity.dart';
import '../../errors/failures.dart';

abstract class ProductRepo{

  Future<Either<Failures,void>> addProduct(AddProductInputEntity addProductInputEntity) ;
}