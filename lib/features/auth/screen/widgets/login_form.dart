import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../common/utils/constants/app_colors.dart';
import '../../../../common/utils/constants/dimensions.dart';
import '../../../../common/utils/constants/text.dart';
import '../../../../common/utils/decoration/textformfield_decoration/textformfield_decoaration.dart';
import '../../../../common/utils/helpers/helpers_function.dart';
import '../../../../common/utils/style/widget/text_style.dart';
import '../../../../common/utils/validators/validators.dart';
import '../../../../model/user_login_model.dart';
import '../../controller/auth_controller.dart';

class LoginForm extends ConsumerStatefulWidget {
  LoginForm({
    super.key,
  });

  @override
  ConsumerState<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends ConsumerState<LoginForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  userLogin(UserLoginDataModel userLoginDataModel){
    print(userLoginDataModel);
    if(_formKey.currentState!.validate()){
      ref.read(authControllerProvider.notifier).loginUser(context, userLoginDataModel);
    }

  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Text(CAppTexts.loginTitle,style: customTextStyle(fontWeight: FontWeight.w500,fontSize: 21)),
          SizedBox(height: screenHeight * 0.008,),
          Text(CAppTexts.loginSubTitle,style: customTextStyle(color: Color(0xff838383),fontSize: 15,fontWeight: FontWeight.w400)),
          SizedBox(height: screenHeight * 0.045,),
          TextFormField(
            controller: userNameController,
            decoration: CTextFromFieldDecoration.userNameInputDecoration,
            validator: (value) => CAppValidators.validateField(value, "username"),
            autovalidateMode: AutovalidateMode.onUserInteraction,
          ),
          TextFormField(
            controller: passwordController,
            decoration: CTextFromFieldDecoration.passwordInputDecoration,
            validator: (value) => CAppValidators.validatePassword(value),
            autovalidateMode: AutovalidateMode.onUserInteraction,
          ),
          SizedBox(height: screenHeight * 0.045,),
          Text(CAppTexts.forgotPassword,style: customTextStyle(color: AppColors.primaryColor,fontWeight: FontWeight.w400,fontSize: 16)),
          SizedBox(height: screenHeight * 0.045,),
          InkWell(
            onTap: () {
              UserLoginDataModel userLoginData = UserLoginDataModel(
                  username: userNameController.text,
                  password: passwordController.text,
                  isMobile: true
              );
              userLogin(userLoginData);
            },
            child: Container(
                width: screenWidth * 0.35,
                height: screenHeight *0.06,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.blue
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(CAppTexts.signIn,style: customTextStyle(fontSize: 16,fontWeight: FontWeight.w400),),
                    SizedBox(width: screenWidth * 0.01,),
                    Icon(Icons.arrow_right_alt,size: 24,)
                  ],)),
          )
        ],
      ),
    );
  }
}