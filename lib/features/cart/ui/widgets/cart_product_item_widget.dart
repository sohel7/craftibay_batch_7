import 'package:craftybaynew/app/app_colors.dart';
import 'package:craftybaynew/app/assets_path.dart';
import 'package:craftybaynew/features/common/ui/widgets/product_quantity_inc_dec_button.dart';
import 'package:flutter/material.dart';

class CartProductItemWidget extends StatelessWidget {
  const CartProductItemWidget({
    super.key,
    required this.textTheme,
  });

  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      color: Colors.white,
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 4),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
        child: Row(
          children: [
            Image.asset(
              AssetsPath.dummyImagePng,
              width: 90,
              height: 90,
            ),
            const SizedBox(
              width: 8,
            ),
            Expanded(
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    'Knike Shoe for New Year'
                                    ' 2025  for New Year 2025',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: textTheme.bodyLarge?.copyWith(
                                        fontSize: 20,
                                        overflow: TextOverflow.ellipsis),
                                  ),
                                ),
                              ],
                            ),
                            const Row(
                              children: [
                                Text(
                                  'Color: Red',
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.grey),
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  ' Size:X',
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.grey),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.delete,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '\$1000',
                        style: textTheme.titleSmall?.copyWith(
                            color: AppColors.themeColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w300),
                      ),
                      PrdductQuantityIncDecButton(
                        onChange: (int noOfItem) {},
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
