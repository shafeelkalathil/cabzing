import 'package:cabzing_driverapp/common/utils/constants/text.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../constants/app_colors.dart';

class CTextFromFieldDecoration{

  static InputDecoration  userNameInputDecoration = InputDecoration (
    labelText: CAppTexts.username,
    prefixIcon: Icon(Iconsax.user,color: AppColors.iconColor,),
    errorMaxLines: 2,
    prefixIconColor: AppColors.iconColor,
    suffixIconColor: AppColors.iconColor,
    labelStyle: const TextStyle().copyWith(fontSize: 14,color: Colors.white),
    hintStyle: const TextStyle().copyWith(fontSize: 14,color: Colors.white),
    errorStyle: const TextStyle().copyWith(fontFamily: "Poppins"),
    floatingLabelStyle: const TextStyle().copyWith(color: Colors.white.withOpacity(0.8)),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(14),
        topRight: Radius.circular(14),
      ),
      borderSide: BorderSide(width: 2, color: AppColors.borderColor),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(14),
        topRight: Radius.circular(14),
      ),
      borderSide: BorderSide(width: 1, color: AppColors.borderColor),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(14),
        topRight: Radius.circular(14),
      ),
      borderSide: BorderSide(width: 1, color: AppColors.borderColor),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(14),
        topRight: Radius.circular(14),
      ),
      borderSide: BorderSide(width: 2, color: AppColors.borderColor),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(14),
        topRight: Radius.circular(14),
      ),
      borderSide: BorderSide(width: 1, color: AppColors.borderColor),
    ),

  );

  static InputDecoration  passwordInputDecoration = InputDecoration (
    labelText: CAppTexts.password,
    prefixIcon: Icon(Iconsax.key,color: AppColors.iconColor,),
    suffixIcon: Icon(Iconsax.eye,color: AppColors.iconColor,),
    errorMaxLines: 2,
    prefixIconColor: Colors.grey,
    suffixIconColor: Colors.grey,
    labelStyle: const TextStyle().copyWith(fontSize: 14,color: Colors.white),
    hintStyle: const TextStyle().copyWith(fontSize: 14,color: Colors.white),
    errorStyle: const TextStyle().copyWith(fontFamily: "Poppins"),
    floatingLabelStyle: const TextStyle().copyWith(color: Colors.white.withOpacity(0.8)),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(14),
        bottomRight: Radius.circular(14),
      ),
      borderSide: BorderSide(width: 1, color: AppColors.borderColor),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(14),
        bottomRight: Radius.circular(14),
      ),
      borderSide: BorderSide(width: 1, color: AppColors.borderColor),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(14),
        bottomRight: Radius.circular(14),
      ),
      borderSide: BorderSide(width: 1, color: AppColors.borderColor),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(14),
        bottomRight: Radius.circular(14),
      ),
      borderSide: BorderSide(width: 1, color: AppColors.borderColor),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(14),
        bottomRight: Radius.circular(14),
      ),
      borderSide: BorderSide(width: 1, color: AppColors.borderColor),
    ),

  );
}