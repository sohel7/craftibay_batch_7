import 'package:craftybaynew/features/product/ui/widgets/Product_image_carousel_slider.dart';
import 'package:craftybaynew/features/product/ui/widgets/product_quantity_inc_dec_button.dart';
import 'package:flutter/material.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key, required this.productId});

  final int productId;
  static const String name= '/product/product-details/';

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('Product Details'),
      ),
      body:  const Column(
        children: [
          ProductImageCarouselSlider(),
          Row(
            children: [
              Column(),
              PrdductQuantityIncDecButton(),
            ],
          )
        ],
      ),
    );
  }
}
