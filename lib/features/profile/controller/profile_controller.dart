
import 'package:cabzing_driverapp/common/utils/type_def/failure.dart';
import 'package:cabzing_driverapp/features/auth/controller/auth_controller.dart';
import 'package:cabzing_driverapp/model/user_login_model.dart';
import 'package:cabzing_driverapp/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../common/utils/helpers/helpers_function.dart';
import '../../profile/screen/profile.dart';
import '../repository/profile_repository.dart';



final profileControllerProvider =
StateNotifierProvider<ProfileController, bool>((ref) {
  return ProfileController(
    profileRepository: ref.watch(profileRepositoryProvider),
    ref: ref,
  );
});



class ProfileController extends StateNotifier<bool> {
  final ProfileRepository _profileRepository;
  final Ref _ref;
  ProfileController({required ProfileRepository profileRepository, required Ref ref})
      : _profileRepository = profileRepository,
        _ref = ref,
        super(false);



  Future<UserModel> fetchUserData(BuildContext context) async {
    try {

      int userId = _ref.watch(currentUserId);
      String token = _ref.watch(currentUserToken);


      final res = await _profileRepository.fetchUserData(token, userId);
      return res.fold(
            (l) {
          CAppHelperFunction.showSnackBar(l.message, context);
          throw Exception(l.message);
        },
            (r) => r,
      );
    } catch (e) {
      CAppHelperFunction.showSnackBar(e.toString(), context);
      throw Exception(e.toString());
    }
  }


}


