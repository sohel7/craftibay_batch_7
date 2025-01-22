

import 'package:carousel_slider/carousel_slider.dart';
import 'package:craftybaynew/app/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProductImageCarouselSlider extends StatelessWidget {
  const ProductImageCarouselSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<int> _selectedIndex = ValueNotifier(0);

    return Stack(
      children: [
        CarouselSlider(
          options: CarouselOptions(
              height: 230.0, viewportFraction: 0.95,
              onPageChanged: (currentIndex, reason){
                _selectedIndex.value = currentIndex;
              },
          ),
          items: [1, 2, 3, 4, 5].map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                    width: MediaQuery
                        .of(context)
                        .size
                        .width,
                   // margin: const EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: const BoxDecoration(
                      color: Colors.black12,
                     // color: AppColors.themeColor,
                     // borderRadius: BorderRadius.circular(8),
                    ),
                    alignment: Alignment.center,
                    child: Text('text $i', style: const TextStyle(fontSize: 16.0),)
                );
              },
            );
          }).toList(),
        ),
       Positioned(
         bottom:8,
         left: 0,
         right: 0,
         child: ValueListenableBuilder(
           valueListenable: _selectedIndex,
           builder: (context, value, _) {
             return Row(
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 for (int i=0; i < 5; i++ )
                    Container(
                      height: 20,
                      width: 20,
                      margin: const EdgeInsets.symmetric(horizontal: 5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: value == i? AppColors.themeColor: Colors.white,
                        border: Border.all(color: Colors.grey.shade300),
         
                      ),
                    ),
               ],
             );
           }
         ),
       )
      ],
    );
  }
}

