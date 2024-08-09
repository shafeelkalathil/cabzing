import 'package:cabzing_driverapp/common/utils/constants/dimensions.dart';
import 'package:cabzing_driverapp/common/utils/constants/image_constants.dart';
import 'package:cabzing_driverapp/common/utils/constants/text.dart';
import 'package:cabzing_driverapp/features/profile/controller/profile_controller.dart';
import 'package:cabzing_driverapp/features/profile/screen/widgets/profile_menu.dart';
import 'package:cabzing_driverapp/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';

class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({super.key});

  @override
  ConsumerState<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen> {

  UserModel? userData;

  Future<void> fetchData() async {
    userData = await ref.read(profileControllerProvider.notifier).fetchUserData(context);
  }


  @override
  void initState() {
    fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(screenWidth*0.05),
          child: Column(
            children: [
              Container(
                width: screenWidth,
                height: screenHeight * 0.18,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage(ImageConstants.profileIcon),
                      backgroundColor: Colors.transparent,
                      radius: screenWidth*0.1,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("David Arnold"),
                        Text("ahhh@gmail.com")
                      ],
                    ),
                    Icon(Iconsax.edit)
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: screenWidth * 0.4,
                    height: screenHeight * 0.15,
                    padding: EdgeInsets.only(left: 15),
                    child: Row(
                      children: [
                        Container(
                          width: screenWidth * 0.12,
                          height: screenHeight * 0.14,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            color: Color(0xffB5CDFE)
                          ),
                          child: Center(
                            child: Icon(Iconsax.star),
                          ),
                        ),
                        SizedBox(width: screenWidth *0.01,),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                Text("4.3"),
                                Icon(Iconsax.star1)
                              ],
                            ),
                            Text('2,211'),
                            Text('rides')
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: screenWidth * 0.4,
                    height: screenHeight * 0.15,
                    padding: EdgeInsets.only(left: 15),
                    child: Row(
                      children: [
                        Container(
                          width: screenWidth * 0.12,
                          height: screenHeight * 0.14,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            color: Color(0xffB5CDFE)
                          ),
                          child: Center(
                            child: Icon(Iconsax.star),
                          ),
                        ),
                        SizedBox(width: screenWidth *0.01,),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                Text("KYC"),
                                Icon(Iconsax.tick_circle)
                              ],
                            ),
                            Text('Verified')
                          ],
                        )
                      ],
                    ),
                  ),

                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Iconsax.logout_1,color: Color(0xffEA6262),),
                  SizedBox(width: screenWidth * 0.01,),
                  Text(CAppTexts.logout)
                ],
              ),
              TProfileMenu()
            ],
          ),
        ),
      ),
    );
  }
}
