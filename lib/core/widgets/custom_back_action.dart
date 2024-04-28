import 'package:contactcars_task/core/constants/colors.dart';
import 'package:flutter/material.dart';

class CustomBackAction extends StatelessWidget {
  const CustomBackAction({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        height: 45,
        width: 45,
        decoration: BoxDecoration(
          color: AppColors.accentColor,
          borderRadius: BorderRadius.circular(13),
        ),
        child: const Icon(Icons.arrow_back_ios_new_rounded),
      ),
    );
  }
}
