import 'package:flutter/material.dart';
import 'package:fruits_hub_dashboard/features/add_product/presentation/views/widgets/is_featured_check_box.dart';

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
              hintText: 'Product Name',
              textInputType: TextInputType.text,
            ),
            SizedBox(height: 16),
            CustomTextFormFiled(
              hintText: 'Product Price',
              textInputType: TextInputType.number,
            ),
            SizedBox(height: 16),
            CustomTextFormFiled(
              hintText: 'Product Code',
              textInputType: TextInputType.text,
            ),
            SizedBox(height: 16),
            CustomTextFormFiled(
              maxLines: 5,
              hintText: 'Description',
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
            ImageField(onFileChange: (image) {}),
          ],
        ),
      ),
    );
  }
}
