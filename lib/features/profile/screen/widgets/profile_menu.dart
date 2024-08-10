import 'package:cabzing_driverapp/common/utils/constants/dimensions.dart';
import 'package:cabzing_driverapp/common/utils/constants/image_constants.dart';
import 'package:cabzing_driverapp/common/utils/style/widget/text_style.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class TProfileMenu extends StatelessWidget {
  const TProfileMenu({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: screenWidth,
      height: screenHeight * 0.4,
      child: Column(
        children: [
          Expanded(
            child: ListTile(
              title: Text("Help",style: customTextStyle(fontWeight: FontWeight.w400,fontSize: 15),),
              leading: Image(image: AssetImage(ImageConstants.helpIcon)),
              trailing: const Icon(Iconsax.arrow_right_34),
            ),
          ),
          Expanded(
            child: ListTile(
              hoverColor: Colors.white,
              title: Text("FAQ",style: customTextStyle(fontWeight: FontWeight.w400,fontSize: 15),),
              leading: Image(image: AssetImage(ImageConstants.faqIcon)),
              trailing: const Icon(Iconsax.arrow_right_34),
            ),
          ),
          Expanded(
            child: ListTile(
              hoverColor: Colors.white,
              title: Text("Invite Friends",style: customTextStyle(fontWeight: FontWeight.w400,fontSize: 15),),
              leading: Image(image: AssetImage(ImageConstants.addUserIcon)),
              trailing: const Icon(Iconsax.arrow_right_34),
            ),
          ),
          Expanded(
            child: ListTile(
              hoverColor: Colors.white,
              title: Text("Terms of service",style: customTextStyle(fontWeight: FontWeight.w400,fontSize: 15),),
              leading: const Icon(Iconsax.shield_search,color: Color(0xffB5CDFE),),
              trailing: const Icon(Iconsax.arrow_right_34),
            ),
          ),
          Expanded(
            child: ListTile(
              hoverColor: Colors.white,
              title: Text("Privacy Policy",style: customTextStyle(fontWeight: FontWeight.w400,fontSize: 15),),
              leading: Image(image: AssetImage(ImageConstants.privacyPolicyIcon)),
              trailing: const Icon(Iconsax.arrow_right_34),
            ),
          ),
        ],
      ),
    );
  }
}