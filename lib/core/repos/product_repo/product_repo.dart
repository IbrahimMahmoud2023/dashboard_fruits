import 'package:dartz/dartz.dart';
import '../../../features/add_product/domain/entites/product_entity.dart';
import '../../errors/failures.dart';

abstract class ProductRepo{

  Future<Either<Failures,void>> addProduct(ProductEntity addProductInputEntity) ;
}