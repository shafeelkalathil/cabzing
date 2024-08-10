import 'package:cabzing_driverapp/common/utils/style/widget/text_style.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../common/utils/constants/dimensions.dart';
import '../../../../common/utils/constants/image_constants.dart';

class UserRatingAndKyc extends StatelessWidget {
  const UserRatingAndKyc({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: screenWidth * 0.4,
          height: screenHeight * 0.15,
          padding: const EdgeInsets.only(left: 15),
          child: Row(
            children: [
              Container(
                width: screenWidth * 0.12,
                height: screenHeight * 0.12,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    color: Color(0xffB5CDFE)
                ),
                child: Center(
                  child: Image.asset(ImageConstants.starIcon),
                ),
              ),
              SizedBox(width: screenWidth *0.025,),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text("4.3",style: customTextStyle(fontWeight: FontWeight.w400,fontSize: 18),),
                      const Icon(Iconsax.star1)
                    ],
                  ),
                  Text('2,211',style: customTextStyle(color: const Color(0xff565656),fontWeight: FontWeight.w400,fontSize: 14),),
                  Text('rides',style: customTextStyle(color: const Color(0xffB5CDFE),fontWeight: FontWeight.w400,fontSize: 14),)
                ],
              )
            ],
          ),
        ),
        Container(
          width: screenWidth * 0.4,
          height: screenHeight * 0.15,
          padding: const EdgeInsets.only(left: 15),
          child: Row(
            children: [
              Container(
                width: screenWidth * 0.12,
                height: screenHeight * 0.12,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    color: Color(0xffA9C9C5)
                ),
                child: const Center(
                  child: Icon(Iconsax.shield_tick),
                ),
              ),
              SizedBox(width: screenWidth *0.025,),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text("KYC",style: customTextStyle(fontWeight: FontWeight.w400,fontSize: 18),),
                      const Icon(Iconsax.tick_circle)
                    ],
                  ),
                  Text('Verified',style: customTextStyle(color: const Color(0xffA9C9C5),fontWeight: FontWeight.w400,fontSize: 14),)
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}