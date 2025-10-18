import 'package:flutter/material.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/app_style_text.dart';

class CustomTextFormFiled extends StatelessWidget {
  const CustomTextFormFiled({
    super.key,
    required this.textInputType,
    this.iconSuffix,
    required this.hintText,
    this.onSaved,  this.obscureText  =false, this.maxLines,
  });
  final TextInputType textInputType;
  final Widget? iconSuffix;
  final String hintText;
  final void Function(String?)? onSaved;
  final bool obscureText;
  final int? maxLines;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: TextFormField(
        maxLines: maxLines,
        obscureText:obscureText ,
        onSaved: onSaved,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'هذا الحقل مطلوب';
          } else {
            return null;
          }
        },
        keyboardType: textInputType,
        decoration: InputDecoration(
          filled: true,
          suffixIcon: iconSuffix,
          hintText: hintText,
          hintStyle: AppTextStyles.semibold16.copyWith(
            color: Color(0xFF9DA5A6),
          ),
          fillColor: Color(0xFFF9FAFA),
          border: buildOutlineInputBorder(),
          enabledBorder: buildOutlineInputBorder(),
          focusedBorder: buildOutlineInputBorder(),
        ),
      ),
    );
  }

  OutlineInputBorder buildOutlineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(4),
      borderSide: BorderSide(color: Color(0xFFEBEDED)),
    );
  }
}
