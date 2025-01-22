import 'package:craftybaynew/app/app_colors.dart';
import 'package:craftybaynew/features/product/ui/screens/product_list_screen.dart';
import 'package:flutter/material.dart';

class CategoryItemWidget extends StatelessWidget {
  const CategoryItemWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, ProductListScreen.name, arguments:'Computer');
      },
      child: Column(
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
      
      ),
    );
  }
}