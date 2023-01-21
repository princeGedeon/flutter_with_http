
import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/app_styles.dart';

class AppInputv2 extends StatelessWidget {
  final String label;
  final TextEditingController? controller;
  final ValidationBuilder validationBuilder;
  final double height;
  final TextInputType inputType;
  final TextAlign textAlign;
  final bool isObscure;
  final bool isEnable;
  final IconData suffixIcon;
  final String prefixIndicatif;
  final String initialValue;
  final int minLength;
  final int minLines;
  final int maxlength;
  final int maxlines;

  const AppInputv2({
    Key? key,
    this.label = "",
    required this.controller,
    required this.validationBuilder,
    this.height = 55,
    this.inputType = TextInputType.text,
    this.isObscure = false,
    this.suffixIcon = Icons.edit,
    this.prefixIndicatif = "",
    this.isEnable = true,
    this.minLength = 1,
    this.minLines = 1,
    this.maxlines = 1,
    this.maxlength = 200,
    this.initialValue = "",
    this.textAlign = TextAlign.start,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: TextFormField(
        decoration: InputDecoration(
          filled: true,
          fillColor: getScaffCont(context),
          focusColor: getPrimaryColor(context),
          enabled: isEnable,
          labelText: label,
          prefixText: prefixIndicatif,
          /*floatingLabelBehavior: FloatingLabelBehavior.never,*/
        ),
        obscureText: isObscure,
        keyboardType: inputType,
        controller: controller,
        minLines: minLines,
        maxLines: maxlines,
        validator: ((value) {
          if (value == null || value.isEmpty) {
            return "Entrer un texte valide";
          }
          return null;
        }),
        textAlign: textAlign,
        style: GoogleFonts.poppins(fontSize: 16),
      ),
    );
  }
}