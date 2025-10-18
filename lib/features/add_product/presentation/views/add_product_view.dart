import 'package:flutter/material.dart';
import 'package:fruits_hub_dashboard/features/add_product/presentation/views/widgets/add_product_view_body.dart';

import '../../../../core/widgets/build_app_bar.dart';

class AddProductView extends StatelessWidget {
  const AddProductView({super.key});
  static const routeName = 'add_product';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(context),
      body: AddProductViewBody(),
    );
  }


}
