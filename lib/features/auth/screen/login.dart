import 'package:cabzing_driverapp/common/utils/constants/app_colors.dart';
import 'package:cabzing_driverapp/common/utils/constants/dimensions.dart';
import 'package:cabzing_driverapp/common/utils/constants/image_constants.dart';
import 'package:cabzing_driverapp/common/utils/constants/text.dart';
import 'package:cabzing_driverapp/common/utils/decoration/textformfield_decoration/textformfield_decoaration.dart';
import 'package:cabzing_driverapp/features/auth/screen/widgets/login_form.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../common/utils/constants/dimensions.dart';
import '../../../common/utils/constants/dimensions.dart';
import '../../../common/utils/theme/custom_theme/text_form_field_theme.dart';

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
                  const Text("English")
                ],
              ),
              
              LoginForm(),

              Column(
                children: [
                  Text(CAppTexts.dontHaveAccount,style: ,),
                  Text("data"),
                  Text("data"),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}





