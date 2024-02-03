import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../helper/appColors.dart';

Widget reuseAbleTextField(
    TextEditingController controller,
    String hint,
    // String? labelText,
    TextInputType textInputType,
    TextInputAction textInputAction) {
  return TextField(
      textInputAction: textInputAction,
      keyboardType: textInputType,
      controller: controller,
      style: GoogleFonts.openSans(
        fontSize: 15,
      ),
      decoration: InputDecoration(
          alignLabelWithHint: true,
          hintText: hint,
          // labelText: labelText,
          hintStyle: GoogleFonts.openSans(
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
          border: OutlineInputBorder(),
          enabled: true,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: AppColors.nonActiveTextFieldColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: AppColors.activeTextFieldColor),
          ),
          labelStyle: GoogleFonts.openSans(
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
          ),
      );
 }