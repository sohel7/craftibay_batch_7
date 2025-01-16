import 'dart:ui';

import 'package:craftybaynew/app/app_colors.dart';
import 'package:craftybaynew/features/product/ui/widgets/Product_image_carousel_slider.dart';
import 'package:craftybaynew/features/product/ui/widgets/color_picker_widget.dart';
import 'package:craftybaynew/features/product/ui/widgets/product_quantity_inc_dec_button.dart';
import 'package:craftybaynew/features/product/ui/widgets/size_picker_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key, required this.productId});

  final int productId;
  static const String name = '/product/product-details/';

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details'),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const ProductImageCarouselSlider(),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(

                              children: [
                                Text(
                                  'Happy newYear Special deal, Save 30%',
                                  style: textTheme.titleMedium,
                                ),
                              ],
                            ),
                            PrdductQuantityIncDecButton(
                              onChange: (int value) {},
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            const Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                  size: 16,
                                ),
                                SizedBox(
                                  width: 4,
                                ),
                                Text(
                                  '4.5',
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                            TextButton(
                                onPressed: () {},
                                child: const Text('Review',
                                    style: TextStyle(
                                        color: AppColors.themeColor,
                                        fontWeight: FontWeight.bold))),
                            Container(
                              padding: const EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                color: AppColors.themeColor,
                              ),
                              child: const Icon(
                                Icons.favorite,
                                size: 14,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Text(
                          'Color',
                          style: textTheme.titleMedium,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        ColorPickerWidget(colors: const [
                          'Red',
                          'Green',
                          'Yellow',
                          'White',
                          'Black',
                        ], onColorSelected: (String selectedColor) {}),
                        const SizedBox(
                          height: 16,
                        ),
                        Text(
                          'Size',
                          style: textTheme.titleMedium,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        SizePickerWidget(size: const [
                          'S',
                          'M',
                          'L',
                          'XL',
                          'XXL',
                        ], onSizeSelected: (String selectedSize) {}),
                        const SizedBox(
                          height: 16,
                        ),
                        Text(
                          'Description',
                          style: textTheme.titleMedium,
                        ),
                        const Text('''Lorem Ipsum is simply dummy text of the printing and Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the ''', textAlign: TextAlign.start,
                          style: TextStyle(
                          fontSize: 12,
                        ),),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          buildPriceAndAddtoSection(textTheme),
        ],
      ),
    );
  }

  Widget buildPriceAndAddtoSection(TextTheme textTheme) {
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
              Text('Price', style: textTheme.titleSmall),
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
              child: Text('Add To Card'),
            ),
          )
        ],
      ),
    );
  }
}
