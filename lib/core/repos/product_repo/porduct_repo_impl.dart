import 'package:dartz/dartz.dart';
import 'package:fruits_hub_dashboard/core/repos/product_repo/product_repo.dart';
import 'package:fruits_hub_dashboard/core/services/data_base_services.dart';
import 'package:fruits_hub_dashboard/core/utils/backend_point.dart';
import 'package:fruits_hub_dashboard/features/add_product/domain/entites/add_product_input_entity.dart';

import '../../../features/add_product/data/models/add_product_input_model.dart';
import '../../errors/failures.dart';

class ProductRepoImpl implements ProductRepo {
  final DataBaseServices dataBaseServices;
  ProductRepoImpl(this.dataBaseServices);
  @override
  Future<Either<Failures, void>> addProduct(AddProductInputEntity input)async {
  try{
    await dataBaseServices.addData(path: BackEndEndPoint.kAddProduct, data: AddProductInputModel.fromEntity(input).toJson());
    return const Right(null);
  }catch (e){
    return Left(Failures(errorMessage: 'Something went wrong add product'));

  }
  }

}