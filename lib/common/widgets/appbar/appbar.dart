
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../utils/constants/app_colors.dart';
import '../../utils/helpers/helpers_function.dart';

class CAppBar extends StatelessWidget implements PreferredSizeWidget{
  const CAppBar({super.key,
    this.title,
    this.showBackArrow = false,
    this.showDrawer = false,
    this.leadingIcon,
    this.actions,
    this.leadingOnPressed,
    this.tabItems = const [],
    this.showTabBar = false,
  });

  final Widget? title;
  final bool showBackArrow,showTabBar,showDrawer;
  final IconData? leadingIcon;
  final List<Widget>? actions;
  final List<String> tabItems;
  final VoidCallback? leadingOnPressed;

  @override
  Widget build(BuildContext context) {
    return  Padding(
        padding:  const EdgeInsets.symmetric(horizontal: 5),
        child: AppBar(
          automaticallyImplyLeading: false,
          leading: showBackArrow
              ? IconButton(onPressed: ()=> CAppHelperFunction.navigateToBackScreen(context), icon: const Icon(Iconsax.arrow_left),color: Colors.white,)
              : leadingIcon != null
              ? IconButton(onPressed: ()=> leadingOnPressed, icon:  Icon(leadingIcon))
              : showDrawer == true
              ? Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(Icons.menu,color: Colors.white,),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              );
            },
          )
              : null,
          title: title,
          bottom: showTabBar
              ? TabBar(isScrollable: false, tabs: tabItems.map((title) => Tab(child: Center(child: Text(title,style: Theme.of(context).textTheme.labelMedium)),),).toList(),)
              : null,
          actions: actions,
        ),
      
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight + (showTabBar ? kToolbarHeight : 0));
}
