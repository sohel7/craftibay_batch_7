import 'package:craftybaynew/app/app_colors.dart';
import 'package:flutter/material.dart';

class CategoryItemWidget extends StatelessWidget {
  const CategoryItemWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
              color: AppColors.themeColor.withOpacity(0.04),
              borderRadius: BorderRadius.circular(8)
          ),
          child:  Icon(
            Icons.computer,
            color: AppColors.themeColor.withOpacity(0.6),
            size: 48,
          ),
        ),
        const SizedBox(height: 4,),
         const Text('Computer', style: TextStyle(
          fontSize: 12, fontWeight: FontWeight.w600,
          letterSpacing: 1,
          color: AppColors.themeColor,
        ),
        )
      ],

    );
  }
}