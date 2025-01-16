import 'package:craftybaynew/app/app_colors.dart';
import 'package:flutter/material.dart';

class SizePickerWidget extends StatefulWidget {
   SizePickerWidget({super.key, required this.size, required this.onSizeSelected});

  final List<String> size;
  final Function(String) onSizeSelected;

  @override
  State<SizePickerWidget> createState() => _SizePickerWidgetState();
}

class _SizePickerWidgetState extends State<SizePickerWidget> {
  String? _selectedSize;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: _getSizeItems(),
      ),
    );
  }

  List<Widget> _getSizeItems() {
    List<Widget> SizeItemWidgetList = [];
    for (String size in widget.size) {
      Widget item = getSizeItemWidget(
          name: size,
          onTap: () {
            _selectedSize = size;
            widget.onSizeSelected(_selectedSize!);
            setState(() {});
          },
          isSelected: _selectedSize == size);
      SizeItemWidgetList.add(item);
    }
    return SizeItemWidgetList;
  }




  Widget getSizeItemWidget(
      {required String name,
      required VoidCallback onTap,
      required bool isSelected}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(right: 8),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            border: Border.all(),
            color: isSelected ? AppColors.themeColor : Colors.transparent),
        alignment: Alignment.center,
        child: Text(
          name,
          style: TextStyle(color: isSelected ? Colors.white : null),
        ),
      ),
    );
  }
}
