import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:fruits_hub_dashboard/core/services/storage_services.dart';
import 'package:fruits_hub_dashboard/core/utils/backend_point.dart';

import '../../errors/failures.dart';
import 'image_repo.dart';

class ImagesRepoImpl implements ImageRepo {
  final StorageServices storageServices;
  ImagesRepoImpl(this.storageServices);

  @override
  Future<Either<Failures, String>> uploadImage(File image) async {
    try {
      String url = await storageServices.uploadImage(
        image,
        BackEndEndPoint.kPathImages,
      );
      return Right(url);
    } catch (e) {
      return Left(
        Failures(errorMessage: 'failed to upload image ${e.toString()}'),
      );
    }
  }
}
