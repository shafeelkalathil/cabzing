import 'package:cabzing_driverapp/common/utils/constants/app_colors.dart';
import 'package:flutter/material.dart';


class NavBarItem extends StatelessWidget {
  final bool isSelected;
  final IconData icon;
  const NavBarItem({super.key,required this.isSelected,required this.icon});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10,left: 10,right: 10),
      child: Column(children: [
        Icon(icon,color: isSelected?AppColors.white:AppColors.grey,),
        const SizedBox(height: 8,),
        isSelected?const CircleAvatar(radius: 3,backgroundColor: AppColors.white,):const SizedBox(height: 8,),
      ],),
    );
  }
}
