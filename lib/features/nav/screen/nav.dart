import 'package:cabzing_driverapp/common/utils/constants/dimensions.dart';
import 'package:cabzing_driverapp/features/home/screen/home.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {

  PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: ClipRRect(
        // height: 80,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
          // bottomLeft: Radius.circular(19),
          // bottomRight: Radius.circular(19),

        ),
        child: BottomNavigationBar(
          items:  <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Iconsax.home),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Iconsax.home),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Iconsax.home),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Iconsax.home),
              label: '',
            ),
          ],
          type: BottomNavigationBarType.shifting,
          // currentIndex: select,
          // iconSize: 10,
          onTap: (index) {
            // setState(() {
            //   select = index;
            // });
            // controller.jumpToPage(index);
          },
          // elevation: 0,
        ),
      ),


      body: SafeArea(

        child: PageView(
          controller: controller,
          physics: const NeverScrollableScrollPhysics(),
          children:   [
            HomeScreen(),
            Container(
              width: screenWidth,
              height: screenHeight,
              color: Colors.red,
            ),
            Container(
              width: screenWidth,
              height: screenHeight,
              color: Colors.grey,
            ),
            Container(
              width: screenWidth,
              height: screenHeight,
              color: Colors.orange,
            ),
          ],
        ),

      ),


    );
  }
}
