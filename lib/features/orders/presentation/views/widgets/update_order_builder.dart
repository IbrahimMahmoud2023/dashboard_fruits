import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub_dashboard/core/helper_function/show_snack_bar.dart';
import 'package:fruits_hub_dashboard/features/orders/presentation/manager/update_order/update_order_cubit.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class UpdateOrderBuilder extends StatelessWidget {
  const UpdateOrderBuilder({super.key, required this.child});
final Widget child;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UpdateOrderCubit, UpdateOrderState>(
      builder: (context, state) {
        if(state is UpdateOrderLoading){
          return ModalProgressHUD(inAsyncCall: state is UpdateOrderLoading ? true : false, child: child);
        }else {
          return child;
        }
      },
      listener: (context, state) {
      if(state is UpdateOrderSuccess){
        return showSnackBar(context, 'updated order successfully');
      }
      if(state is UpdateOrderFailure){
        return showSnackBar(context, state.errorMessage);
      }
      },
    );
  }
}
