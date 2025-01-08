import 'package:craftybaynew/features/common/ui/controllers/main_bottom_nav_controller.dart';
import 'package:craftybaynew/features/common/ui/widgets/category_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class CategoryListScreen extends StatelessWidget {
  const CategoryListScreen({super.key});

  static const String name = '/category-list-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Category List'),
          leading: IconButton(
              onPressed: (){
                Get.find<MainBottomNavController>().changeIndex(0);
              },
              icon: Icon(Icons.arrow_back_ios)),
        ),
        body: GridView.builder(
          itemCount: 20,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
              crossAxisSpacing: 4,
              mainAxisSpacing: 16,
            ),
            itemBuilder: (context, index) {
              return const FittedBox(child: CategoryItemWidget());
            },),);
  }
}
