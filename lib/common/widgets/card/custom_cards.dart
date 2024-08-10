import 'package:flutter/material.dart';
import '../../utils/constants/app_colors.dart';

class CustomCards extends StatelessWidget {
  final Widget child;
  final GestureTapCallback? onTap;
  const CustomCards({super.key,required this.child,this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onTap,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: AppColors.blackShade),
          child:Padding(
            padding: const EdgeInsets.all(15),
            child: child,
          ),
        ),
      ),
    );
  }
}
