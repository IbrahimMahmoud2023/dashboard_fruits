import '../../../features/add_product/domain/entites/add_product_input_entity.dart';

abstract class ProductRepo{

  Future<void> addProduct(AddProductInputEntity addProductInputEntity) ;
}