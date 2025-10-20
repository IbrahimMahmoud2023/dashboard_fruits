import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub_dashboard/constants.dart';
import 'package:fruits_hub_dashboard/core/widgets/custom_button.dart';
import 'package:fruits_hub_dashboard/features/add_product/domain/entites/add_product_input_entity.dart';
import 'package:fruits_hub_dashboard/features/add_product/presentation/views/widgets/is_featured_check_box.dart';
import '../../../../../core/helper_function/show_snack_bar.dart';
import '../../manager/add_product_cubit.dart';
import 'custom_text_form_filed.dart';
import 'image_field.dart';

class AddProductViewBody extends StatefulWidget {
  const AddProductViewBody({super.key});

  @override
  State<AddProductViewBody> createState() => _AddProductViewBodyState();
}

class _AddProductViewBodyState extends State<AddProductViewBody> {
  bool isFeatured = false;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;

  String? productName, productCode, description;
  num? price;
  File? image;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: formKey,
        autovalidateMode: autoValidateMode,
        child: Column(
          children: [
            SizedBox(height: 16),
            CustomTextFormFiled(
              onSaved: (value) {
                productName = value;
              },
              hintText: 'اسم المنتج',

              textInputType: TextInputType.text,
            ),
            SizedBox(height: 16),
            CustomTextFormFiled(
              onSaved: (value) {
                price = int.parse(value!);
              },
              hintText: 'سعر المنتج',
              textInputType: TextInputType.number,
            ),
            SizedBox(height: 16),
            CustomTextFormFiled(
              onSaved: (value) {
                productCode = value;
              },
              hintText: 'كود المنتج',
              textInputType: TextInputType.text,
            ),
            SizedBox(height: 16),
            CustomTextFormFiled(
              onSaved: (value) {
                description = value;
              },
              maxLines: 5,
              hintText: 'وصف المنتج',
              textInputType: TextInputType.text,
            ),
            SizedBox(height: 16),
            IsFeaturedCheckBox(
              isChecked: isFeatured,
              onChanged: (value) {
                setState(() {
                  isFeatured = value;
                });
              },
            ),
            SizedBox(height: 16),
            ImageField(
              onFileChange: (image) {
                this.image = image;
              },
            ),
            SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: kHorizontalPadding,
              ),
              child: CustomButton(
                text: 'إضافة المنتج',
                onPressed: () {
                  if (image != null) {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      AddProductInputEntity input = AddProductInputEntity(
                        image: image!,
                        productName: productName!,
                        description: description!,
                        productCode: productCode!,
                        price: price!,
                        isFeatured: isFeatured,
                      );
                      context.read<AddProductCubit>().addProduct(input);
                    } else {
                      autoValidateMode = AutovalidateMode.always;
                      setState(() {});
                    }
                  } else {
                    showSnackBar(context, 'من فضلك اختر صورة للمنتج');
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
