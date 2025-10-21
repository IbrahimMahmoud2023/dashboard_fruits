import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub_dashboard/core/widgets/custom_progress_hud.dart';
import 'package:fruits_hub_dashboard/features/add_product/presentation/views/widgets/add_product_view_body.dart';

import '../../../../core/helper_function/show_snack_bar.dart';
import '../../../../core/repos/image_repo/image_repo.dart';
import '../../../../core/repos/product_repo/product_repo.dart';
import '../../../../core/services/git_it_services.dart';
import '../../../../core/widgets/build_app_bar.dart';
import '../manager/add_product_cubit.dart';

class AddProductView extends StatelessWidget {
  const AddProductView({super.key});

  static const routeName = 'add_product';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(context),
      body: BlocProvider(
        create: (context) =>
            AddProductCubit(getIt.get<ImageRepo>(), getIt.get<ProductRepo>()),
        child: AddProductViewBody(),
      ),
    );
  }
}
