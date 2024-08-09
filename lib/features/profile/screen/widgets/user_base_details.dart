import 'package:cabzing_driverapp/common/utils/style/widget/text_style.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../common/utils/constants/dimensions.dart';
import '../../../../common/utils/constants/image_constants.dart';

class UserBaseDetails extends StatelessWidget {
  const UserBaseDetails({
    super.key, required this.name, required this.email, required this.imageUrl, required this.isNetworkImage,
  });
  
  final String name,email,imageUrl;
  final bool isNetworkImage;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: screenWidth,
      height: screenHeight * 0.18,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CircleAvatar(
            backgroundImage: isNetworkImage ? NetworkImage(imageUrl) :AssetImage(ImageConstants.profileIcon) as ImageProvider,
            backgroundColor: Colors.transparent,
            radius: screenWidth*0.1,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(name,style: customTextStyle(fontWeight: FontWeight.w500,fontSize: 20),),
              Text(email,style: customTextStyle(color: Color(0xffB5CDFE),fontWeight: FontWeight.w400,fontSize: 14))
            ],
          ),
          Icon(Iconsax.edit)
        ],
      ),
    );
  }
}