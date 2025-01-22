import 'package:craftybaynew/app/app_colors.dart';
import 'package:craftybaynew/app/assets_path.dart';
import 'package:craftybaynew/features/cart/ui/widgets/cart_product_item_widget.dart';
import 'package:craftybaynew/features/common/ui/controllers/main_bottom_nav_controller.dart';
import 'package:craftybaynew/features/common/ui/widgets/product_quantity_inc_dec_button.dart';
import 'package:craftybaynew/features/review/ui/screens/create_rivew_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class CartListScreen extends StatefulWidget {
  const CartListScreen({super.key});

  @override
  State<CartListScreen> createState() => _CartListScreenState();
}

class _CartListScreenState extends State<CartListScreen> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        Get.find<MainBottomNavController>().moveToHomePage();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Cart'),
          leading: IconButton(
            onPressed: () {
              Get.find<MainBottomNavController>().moveToHomePage();
            },
            icon: const Icon(Icons.arrow_back_ios),
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (ontext, index) {
                    return CartProductItemWidget(textTheme: textTheme);
                  }),
            ),
            _buildPriceAndCheckoutSection(textTheme),
          ],
        ),
      ),
    );
  }

  Widget _buildPriceAndCheckoutSection(TextTheme textTheme) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.themeColor.withOpacity(0.2),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Text('Total Price', style: textTheme.titleSmall),
              Text(
                '\$100',
                style: textTheme.titleMedium
                    ?.copyWith(color: AppColors.themeColor),
              )
            ],
          ),
          SizedBox(
            width: 140,
            child: ElevatedButton(
              onPressed: () {},
              child: const Text('Check Out'),
            ),
          )
        ],
      ),
    );
  }
}


