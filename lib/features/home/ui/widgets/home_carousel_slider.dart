

import 'package:carousel_slider/carousel_slider.dart';
import 'package:craftybaynew/app/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeCarouselSlider extends StatelessWidget {
  const HomeCarouselSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<int> _selectedIndex = ValueNotifier(0);

    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
              height: 180.0, viewportFraction: 0.95,
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
                    margin: const EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(
                      color: AppColors.themeColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    alignment: Alignment.center,
                    child: Text('text $i', style: const TextStyle(fontSize: 16.0),)
                );
              },
            );
          }).toList(),
        ),
       const SizedBox(height: 16,),
       ValueListenableBuilder(
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
                      color: value == i? AppColors.themeColor: Colors.transparent,
                      border: Border.all(color: Colors.grey.shade300),

                    ),
                  ),
             ],
           );
         }
       )
      ],
    );
  }
}

