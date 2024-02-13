import 'package:flutter/material.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:google_fonts/google_fonts.dart';

import '../helper/appColors.dart';

class CountryCodePickerTextField extends StatelessWidget {
   TextEditingController? controller;
  final ValueChanged<CountryCode>? onChanged;
  final String? label;
  final bool readOnly;

   CountryCodePickerTextField({
    Key? key,
     this.controller,
    this.onChanged,
    this.label,
    this.readOnly = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      readOnly: readOnly,
      style: GoogleFonts.openSans(
        fontSize: 15,
      ),
      decoration: InputDecoration(
        prefixIcon: CountryCodePicker(
          initialSelection: '+1',
          onChanged: onChanged,
          // Customize CountryCodePicker properties as needed
        ),
        labelText: label,
        alignLabelWithHint: true,
        hintStyle: GoogleFonts.openSans(
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
        border: OutlineInputBorder(),
        enabled: true,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide:
              BorderSide(color: AppColors.nonActiveTextFieldColor),
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
}
