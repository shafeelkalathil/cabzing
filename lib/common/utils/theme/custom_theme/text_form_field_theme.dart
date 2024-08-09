import 'package:cabzing_driverapp/common/utils/constants/text.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../constants/app_colors.dart';

class CTextFromFieldTheme{
  CTextFromFieldTheme._();

  static InputDecorationTheme darkInputDecoration = InputDecorationTheme(
    errorMaxLines: 2,
    prefixIconColor: Colors.grey,
    suffixIconColor: Colors.grey,
    labelStyle: const TextStyle().copyWith(fontSize: 14,color: Colors.white),
    hintStyle: const TextStyle().copyWith(fontSize: 14,color: Colors.white),
    errorStyle: const TextStyle().copyWith(fontFamily: "Poppins"),
    floatingLabelStyle: const TextStyle().copyWith(color: Colors.white.withOpacity(0.8)),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide(width: 1,color: AppColors.borderColor)
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide(width: 1,color: AppColors.borderColor)
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide(width: 1,color: AppColors.borderColor)
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide(width: 1,color: Colors.red)
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide(width: 1,color: Colors.orange)
    ),

  );

}