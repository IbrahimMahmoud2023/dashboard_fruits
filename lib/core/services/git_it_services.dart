import 'package:fruits_hub_dashboard/core/repos/image_repo/images_repo_impl.dart';
import 'package:fruits_hub_dashboard/core/repos/product_repo/porduct_repo_impl.dart';
import 'package:fruits_hub_dashboard/core/repos/product_repo/product_repo.dart';
import 'package:fruits_hub_dashboard/core/services/storage_services.dart';
import 'package:fruits_hub_dashboard/core/services/supabase_storage_services.dart';
import 'package:fruits_hub_dashboard/features/orders/data/repos/order_repo_impl.dart';
import 'package:fruits_hub_dashboard/features/orders/domain/orders_repos/orders_repo.dart';
import 'package:get_it/get_it.dart';
import '../repos/image_repo/image_repo.dart';
import 'data_base_services.dart';
import 'firestore_services.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  getIt.registerSingleton<StorageServices>(SupabaseStorageServices());
  getIt.registerSingleton<DataBaseServices>(FireStoreServices());
  getIt.registerSingleton<ProductRepo>(
    ProductRepoImpl(getIt<DataBaseServices>()),
  );

  getIt.registerSingleton<ImageRepo>(
    ImagesRepoImpl(getIt<StorageServices>()),
  );
  getIt.registerSingleton<OrderRepo>(
    OrdersRepoImpl(dataBaseServices: getIt<DataBaseServices>()),
  );
}
