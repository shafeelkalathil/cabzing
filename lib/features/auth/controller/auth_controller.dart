


import 'package:cabzing_driverapp/model/user_login_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../common/utils/helpers/helpers_function.dart';
import '../../nav/screen/nav.dart';
import '../repository/auth_repository.dart';

final currentUserId = StateProvider((ref) => 0);
final currentUserToken = StateProvider((ref) => "");

final authControllerProvider =
StateNotifierProvider<AuthController, bool>((ref) {
  return AuthController(
    authRepository: ref.watch(authRepositoryProvider),
    ref: ref,
  );
});



class AuthController extends StateNotifier<bool> {
  final AuthRepository _authRepository;
  final Ref _ref;
  AuthController({required AuthRepository authRepository, required Ref ref})
      : _authRepository = authRepository,
        _ref = ref,
        super(false);



  Future<void> loginUser(
      BuildContext context,
      UserLoginDataModel userLoginDataModel
      ) async {

    state = true;

    try {
      final res = await _authRepository.login(context,userLoginDataModel);
      state = false;
      res.fold((l) {
        CAppHelperFunction.showSnackBar(l.message,context);
      }, (userData) async {

        if( userData["success"] == 6000 ){
          SharedPreferences prefs = await SharedPreferences.getInstance();
          final token = userData["data"]["access"];
          final uid = userData['user_id'];
          await prefs.setInt("uid", uid);
          await prefs.setString("token", token);
          _ref.read(currentUserId.notifier).state = uid;
          _ref.read(currentUserToken.notifier).state = token;
          CAppHelperFunction.showSnackBar(userData['message'], context);
          CAppHelperFunction.navigateToScreenAndRemoveUntil(context, const NavBar());
        }else{
          CAppHelperFunction.showSnackBar(userData['error'], context);
        }

        // _ref.read(currentUserIdProvider.notifier).state = userId;
        // _ref.read(currentUserNameProvider.notifier).state = userModel.name ?? "";
        // _ref.read(currentUserCodeProvider.notifier).state = userModel.code ?? "";
        // CAppHelperFunction.navigateToScreenAndRemoveUntil(context, const InvoiceScreen());
      });
    } catch (e) {
      CAppHelperFunction.showSnackBar(e.toString(),context);
    }
  }


}


