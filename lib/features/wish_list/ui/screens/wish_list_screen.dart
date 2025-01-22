import 'package:craftybaynew/features/common/ui/controllers/main_bottom_nav_controller.dart';
import 'package:craftybaynew/features/common/ui/widgets/product_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WishListScreen extends StatefulWidget {
  const WishListScreen({super.key});

  @override
  State<WishListScreen> createState() => _WishListScreenState();
}

class _WishListScreenState extends State<WishListScreen> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop){
        Get.find<MainBottomNavController>().moveToHomePage();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Wish List'),
          leading: IconButton(
              onPressed: (){
                Get.find<MainBottomNavController>().moveToHomePage();
              },
              icon: Icon(Icons.arrow_back_ios)),
        ),
        body: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 0.8,
              crossAxisSpacing: 2,
              mainAxisSpacing: 2
          ),

          itemCount: 20,
          itemBuilder: (context, index) {
            return const FittedBox(child: ProductItemWidget());
          },
        ),
      ),
    );
  }
}
