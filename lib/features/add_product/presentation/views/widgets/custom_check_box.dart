import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';

class CustomCheckBox extends StatelessWidget {
  final bool value;
  final ValueChanged<bool> onChanged;
  const CustomCheckBox({
    super.key,
    required this.value,
    required this.onChanged,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onChanged(!value);
      },
      child: AnimatedContainer(
        height: 25,
        width: 25,
        duration: Duration(milliseconds: 100),
        decoration: ShapeDecoration(
          color: value ? AppColors.primaryColor : Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: BorderSide(
              color: value ? Colors.transparent : Color(0xFFE1E3E3),
            ),
          ),
        ),
        child: value
            ? Icon(Icons.check, color: Colors.white, size: 18)
            : SizedBox(),
      ),
    );
  }
}
