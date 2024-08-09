import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../common/utils/constants/app_colors.dart';
import '../../../../common/utils/constants/dimensions.dart';
import '../../../../common/utils/constants/text.dart';
import '../../../../common/utils/decoration/textformfield_decoration/textformfield_decoaration.dart';
import '../../../../common/utils/helpers/helpers_function.dart';
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
          Text(CAppTexts.loginTitle,style: Theme.of(context).textTheme.titleSmall,),
          SizedBox(height: 30,),
          Text(CAppTexts.loginSubTitle,style: Theme.of(context).textTheme.labelMedium,),
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
          Text(CAppTexts.forgotPassword,style: TextStyle(color: AppColors.iconColor),),
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
                    Text(CAppTexts.signIn),
                    SizedBox(width: screenWidth * 0.01,),
                    Icon(Icons.arrow_right_alt_sharp,size: 20,)
                  ],)),
          )
        ],
      ),
    );
  }
}