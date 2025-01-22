import 'package:craftybaynew/app/assets_path.dart';
import 'package:craftybaynew/features/common/ui/controllers/main_bottom_nav_controller.dart';
import 'package:craftybaynew/features/home/ui/widgets/appbar_icon_button.dart';
import 'package:craftybaynew/features/common/ui/widgets/category_item_widget.dart';
import 'package:craftybaynew/features/home/ui/widgets/home_carousel_slider.dart';
import 'package:craftybaynew/features/home/ui/widgets/home_section_header.dart';
import 'package:craftybaynew/features/common/ui/widgets/product_item_widget.dart';
import 'package:craftybaynew/features/home/ui/widgets/product_search_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const String name = '/home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchBarController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 16,
              ),
              ProductSearchBar(controller: _searchBarController),
              const SizedBox(
                height: 8,
              ),
              const HomeCarouselSlider(),
              const SizedBox(
                height: 16,
              ),
              HomeSectionHeader(
                title: 'Category',
                onTap: () {
                  Get.find<MainBottomNavController>().moveToCategory();
                },
              ),
              const SizedBox(
                height: 8,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: _getCategoryList(),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              HomeSectionHeader(
                title: 'Popular',
                onTap: () {},
              ),

              // const ProducrItemWidget(),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: _getProductList(),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              HomeSectionHeader(
                title: 'Special',
                onTap: () {},
              ),

              // const ProducrItemWidget(),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: _getProductList(),
                ),
              ),

              HomeSectionHeader(
                title: 'New',
                onTap: () {},
              ),

              // const ProducrItemWidget(),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: _getProductList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _getCategoryList() {
    List<Widget> categoryList = [];
    for (int i = 0; i < 20; i++) {
      categoryList.add(const Padding(
        padding: EdgeInsets.only(right: 16.0),
        child: CategoryItemWidget(),
      ));
    }
    return categoryList;
  }

  List<Widget> _getProductList() {
    List<Widget> productList = [];
    for (int i = 0; i < 20; i++) {
      productList.add(const Padding(
        padding: EdgeInsets.only(right: 16.0),
        child: ProductItemWidget(),
      ));
    }
    return productList;
  }

  AppBar buildAppBar() {
    return AppBar(
      title: SvgPicture.asset(AssetsPath.navBarappLogoSvg),
      actions: [
        AppbarIconButton(
          icon: Icons.person_outline,
          onTap: () {},
        ),
        const SizedBox(
          width: 6,
        ),
        AppbarIconButton(
          icon: Icons.call_outlined,
          onTap: () {},
        ),
        const SizedBox(
          width: 6,
        ),
        AppbarIconButton(
          icon: Icons.notifications_outlined,
          onTap: () {},
        ),
      ],
    );
  }
}
