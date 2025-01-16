import 'package:craftybaynew/app/app_colors.dart';
import 'package:flutter/material.dart';

class PrdductQuantityIncDecButton extends StatefulWidget {
  const PrdductQuantityIncDecButton({super.key, required this.onChange});

  final Function(int) onChange;



  @override
  State<PrdductQuantityIncDecButton> createState() =>
      _PrdductQuantityIncDecButtonState();
}

class _PrdductQuantityIncDecButtonState
    extends State<PrdductQuantityIncDecButton> {
  int _count = 1;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        buildIconButton(
            icon: Icons.remove,
            onTap: () {
              if(_count >1) {
                _count--;
                widget.onChange(_count);
                setState(() {});
              }
            }),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Text(
            '$_count',
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        buildIconButton(
            icon: Icons.add,
            onTap: () {
              if(_count < 20) {
                _count++;
                widget.onChange(_count);
                setState(() {});
              }
            }),
      ],
    );
  }

  Widget buildIconButton(
      {required IconData icon, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
            color: AppColors.themeColor,
            borderRadius: BorderRadius.circular(4)),
        alignment: Alignment.center,
        child: Icon(
          icon,
          color: Colors.white,
        ),
      ),
    );
  }
}
