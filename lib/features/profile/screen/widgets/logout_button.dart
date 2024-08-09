import 'package:cabzing_driverapp/common/utils/style/widget/text_style.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../common/utils/constants/dimensions.dart';
import '../../../../common/utils/constants/text.dart';
import '../../../../common/utils/helpers/helpers_function.dart';
import '../../../auth/screen/login.dart';

class LogOutButton extends StatefulWidget {
  const LogOutButton({super.key});

  @override
  State<LogOutButton> createState() => _LogOutButtonState();
}

class _LogOutButtonState extends State<LogOutButton> {
  logOut() async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.remove("uid");
    preferences.remove("token");
    CAppHelperFunction.showAlert("Are you sure?", "Do you want to logout", context, true, ()=> CAppHelperFunction.navigateToScreenAndRemoveUntil(context, LoginScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: () {
            logOut();
          },
          child: Container(
            width: screenWidth *0.4,
            height: screenHeight *0.08,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Iconsax.logout_1,color: Color(0xffEA6262),),
                SizedBox(width: screenWidth * 0.01,),
                Text(CAppTexts.logout,style: customTextStyle(color: Color(0xffEA6262),fontWeight: FontWeight.w400,fontSize: 15),)
              ],
            ),
          ),
        )
      ],
    );
  }
}
