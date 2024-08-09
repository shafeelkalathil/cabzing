
import 'package:cabzing_driverapp/features/auth/controller/auth_controller.dart';
import 'package:cabzing_driverapp/features/auth/screen/login.dart';
import 'package:cabzing_driverapp/features/home/screen/home.dart';
import 'package:cabzing_driverapp/features/nav/screen/nav.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../common/utils/constants/app_colors.dart';
import '../../../common/utils/constants/dimensions.dart';
import '../../../common/utils/constants/image_constants.dart';
import '../../../common/utils/helpers/helpers_function.dart';


class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3)).then((value) async {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      final userId = preferences.getInt("uid");
      final token = preferences.getString("token");
      print(userId);
      print(token);
      if( userId != 0 && token != "" && userId != null){
        ref.read(currentUserId.notifier).state = userId;
        ref.read(currentUserToken.notifier).state = token!;
        CAppHelperFunction.navigateToScreenAndRemoveUntil(context, NavBar());
      }else{
        CAppHelperFunction.navigateToScreenAndRemoveUntil(context, LoginScreen());
      }

    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    screenWidth=MediaQuery.of(context).size.width;
    screenHeight=MediaQuery.of(context).size.height;
    return Scaffold(
        body:Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(image: AssetImage(ImageConstants.appLogo)),
              LoadingAnimationWidget.horizontalRotatingDots(color: AppColors.primaryColor, size: 50),
            ],
          ),
        )
    );
  }
}