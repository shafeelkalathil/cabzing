import 'package:cabzing_driverapp/common/utils/constants/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class TProfileMenu extends StatelessWidget {
  const TProfileMenu({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenWidth,
      height: screenHeight * 0.4,
      child: Column(
        children: [
          Expanded(
            child: ListTile(
              title: Text("Help"),
              leading: Icon(Iconsax.message_question),
              trailing: Icon(Iconsax.arrow_right_34),
            ),
          ),
          Expanded(
            child: ListTile(
              hoverColor: Colors.white,
              title: Text("FAQ"),
              leading: Icon(Iconsax.search_favorite),
              trailing: Icon(Iconsax.arrow_right_34),
            ),
          ),
          Expanded(
            child: ListTile(
              hoverColor: Colors.white,
              title: Text("Invite Friends"),
              leading: Icon(Iconsax.user_add),
              trailing: Icon(Iconsax.arrow_right_34),
            ),
          ),
          Expanded(
            child: ListTile(
              hoverColor: Colors.white,
              title: Text("Terms of service"),
              leading: Icon(Iconsax.shield_search),
              trailing: Icon(Iconsax.arrow_right_34),
            ),
          ),
          Expanded(
            child: ListTile(
              hoverColor: Colors.white,
              title: Text("Privacy Policy"),
              leading: Icon(Iconsax.shield_security2),
              trailing: Icon(Iconsax.arrow_right_34),
            ),
          ),
        ],
      ),
    );
  }
}