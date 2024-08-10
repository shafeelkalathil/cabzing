import 'package:cabzing_driverapp/common/utils/constants/app_colors.dart';
import 'package:cabzing_driverapp/common/utils/constants/dimensions.dart';
import 'package:cabzing_driverapp/common/utils/constants/image_constants.dart';
import 'package:cabzing_driverapp/common/utils/constants/text.dart';
import 'package:cabzing_driverapp/common/utils/style/widget/text_style.dart';
import 'package:cabzing_driverapp/features/auth/screen/widgets/login_form.dart';
import 'package:flutter/material.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(screenWidth * 0.08),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Image(image: AssetImage(ImageConstants.languageIcon)),
                  SizedBox(width: screenWidth * 0.01,),
                  Text("English",style: customTextStyle(fontWeight: FontWeight.w400,fontSize: 14),)
                ],
              ),

              const LoginForm(),

              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(CAppTexts.dontHaveAccount,style: customTextStyle(fontWeight: FontWeight.w400,fontSize: 15),),
                  Text(CAppTexts.signUpNow,style: customTextStyle(color: AppColors.primaryColor,fontSize: 16,fontWeight: FontWeight.w500),),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}





