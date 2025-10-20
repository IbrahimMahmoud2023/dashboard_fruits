import 'package:flutter/material.dart';
import '../../../../../constants.dart';
import '../../../../../core/utils/app_style_text.dart';
import 'custom_check_box.dart';

class IsOrganicCheckBox extends StatelessWidget {
  const IsOrganicCheckBox({
    super.key,
    required this.isChecked,
    required this.onChanged,
  });
  final bool isChecked;
  final ValueChanged<bool> onChanged;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: 'is organic product? ',
                    style: AppTextStyles.semibold13.copyWith(
                      color: Color(0xFFA9B1B1),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Expanded(
          child: SizedBox(
            width: 16,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
          child: CustomCheckBox(value: isChecked, onChanged: onChanged),
        ),


      ],
    );
  }
}
