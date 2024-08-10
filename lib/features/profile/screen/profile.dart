import 'package:cabzing_driverapp/common/utils/constants/dimensions.dart';
import 'package:cabzing_driverapp/features/profile/controller/profile_controller.dart';
import 'package:cabzing_driverapp/features/profile/screen/widgets/logout_button.dart';
import 'package:cabzing_driverapp/features/profile/screen/widgets/profile_menu.dart';
import 'package:cabzing_driverapp/features/profile/screen/widgets/user_base_details.dart';
import 'package:cabzing_driverapp/features/profile/screen/widgets/user_rating_and_kyc.dart';
import 'package:cabzing_driverapp/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skeletonizer/skeletonizer.dart';


class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({super.key});

  @override
  ConsumerState<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen> {

  UserModel? userData;
  bool isLoading = true ;

  Future<void> fetchData() async {

    userData = await ref.read(profileControllerProvider.notifier).fetchUserData(context);
    setState(() {
      isLoading = false ;
    });
  }

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Skeletonizer(
        enabled: isLoading,
        enableSwitchAnimation: true,
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(screenWidth*0.05),
            child: Column(
              children: [
                if(userData!= null) UserBaseDetails(name: userData!.data.firstName + userData!.data.lastName,email: userData!.data.email,imageUrl: userData!.customerData.photo,isNetworkImage: false ),
                const UserRatingAndKyc(),
                const LogOutButton(),
                const TProfileMenu()
              ],
            ),
          ),
        ),
      ),
    );
  }
}




