import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/helper_function/show_snack_bar.dart';
import '../../../../../core/widgets/custom_progress_hud.dart';
import '../../manager/add_product_cubit.dart';
import '../add_product_view.dart';
import 'add_product_view_body.dart';

class AddProductViewBodyBlocBuilder extends StatelessWidget {
  const AddProductViewBodyBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddProductCubit, AddProductState>(
      listener: (context, state) {
        if (state is AddProductFailure) {
          showSnackBar(context, state.errorMessage);
        }
        if (state is AddProductSuccess) {
          showSnackBar(context, 'Product added successfully');
        }
      },
      builder: (context, state) {
        bool isLoading = state is AddProductLoading;
        return Stack(
          children: [
            AddProductViewBody(),
            if (isLoading)
              CustomProgressHud(isLoading: true, child: Container()), // overlay
          ],
        );
      },
    );
  }
}

