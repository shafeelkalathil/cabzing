import 'package:cabzing_driverapp/common/utils/constants/app_colors.dart';
import 'package:cabzing_driverapp/common/utils/constants/dimensions.dart';
import 'package:cabzing_driverapp/features/home/screen/home.dart';
import 'package:cabzing_driverapp/features/nav/screen/widgets/nav_bar_item.dart';
import 'package:cabzing_driverapp/features/profile/screen/profile.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {

  int selectedIndex = 0;
  List icons=[
    Iconsax.home,
    Iconsax.route_square,
    Iconsax.notification_bing,
    Iconsax.user,
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: Container(
          height: screenHeight*0.06,
          color: AppColors.black,
          child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
              children:List.generate(icons.length, (index) {
                return GestureDetector(
                    onTap: () => onItemTapped(index),
                    child: NavBarItem(isSelected: index==selectedIndex, icon: icons[index]));
              },)),
        ),
        body:             itemPage(selectedIndex),

      ),
    );
  }

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  itemPage(int index) {
    switch (index) {
      case 0:
        return  const HomeScreen();
      case 1:
        return  Container();
      case 2:
        return Container();
      case 3:
        return const ProfileScreen();
    }
  }
}

