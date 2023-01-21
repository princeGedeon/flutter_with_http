import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/app_const.dart';
import '../utils/app_styles.dart';

class AppInput extends StatelessWidget {
  final String label;
  final TextEditingController? controller;
  final ValidationBuilder validationBuilder;
  final double height;
  final TextInputType inputType;
  final TextAlign textAlign;
  final bool isObscure;
  final bool isEnable;
  final IconData suffixIcon;
  final String prefixIndicatif ;
  final String initialValue ;
  final int minLength;
  final int minLines;
  final int maxlength;

  const AppInput({
    Key? key,
    this.label = "",
    required this.controller,
    required this.validationBuilder,
    this.height = 55,
    this.inputType = TextInputType.text,
    this.isObscure = false,
    this.suffixIcon = Icons.edit,
    this.prefixIndicatif="",
    this.isEnable = true,
    this.minLength = 1,
    this.minLines = 1,
    this.maxlength = 200,
    this.initialValue="",
    this.textAlign = TextAlign.start,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: TextFormField(
        decoration: InputDecoration(
          enabled: isEnable,
          labelText: label,
          prefixText: prefixIndicatif,
          /*floatingLabelBehavior: FloatingLabelBehavior.never,*/
          suffixIcon: Icon(suffixIcon),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        obscureText: isObscure,
        keyboardType: inputType,
        controller: controller,
        minLines: minLines,
        maxLines: 50,
        validator: validationBuilder.build(),
        textAlign: textAlign,
        style:   GoogleFonts.poppins(fontSize: 16),
      ),
    );
  }
}


class AppInput4 extends StatelessWidget {
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

  const AppInput4({
    Key? key,
    this.label = "",
    required this.controller,
    required this.validationBuilder,
    this.height = 45,
    this.inputType = TextInputType.text,
    this.isObscure = false,
    this.suffixIcon = Icons.edit,
    this.prefixIndicatif = "",
    this.isEnable = true,
    this.minLength = 1,
    this.minLines = 1,
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
          enabled: isEnable,
          labelText: label,
          prefixText: prefixIndicatif,
          /*floatingLabelBehavior: FloatingLabelBehavior.never,*/
          suffixIcon: Icon(suffixIcon),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          filled: true,

        ),
        obscureText: isObscure,
        keyboardType: inputType,
        controller: controller,
        minLines: minLines,
        maxLines: 50,
        validator: validationBuilder.build(),
        textAlign: textAlign,
        style: GoogleFonts.poppins(fontSize: 16),
      ),
    );
  }
}



class AppInput2 extends StatelessWidget {
  final String label;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final double height;
  final TextInputType inputType;
  final TextAlign textAlign;
  final bool isObscure;
  final IconButton suffixIcon;
  final String hint;
  final bool hasSuffix;
  final bool radius;
  final int maxLine;
  final int minLine;
  //final InputDecoration decoration;

  const AppInput2({
    Key? key,
    this.label = "",
    required this.hasSuffix,
    required this.controller,
    required this.validator,
    this.height = 55,
    this.inputType = TextInputType.text,
    this.isObscure = false,
    this.suffixIcon = const IconButton(
      icon: Icon(Icons.edit),
      onPressed: null,
    ),
    this.textAlign = TextAlign.start,
    this.hint = "",
    this.radius = true,
    this.maxLine = 1,
    this.minLine = 1,
  }) : super(key: key);

  @override
  Widget build(
      BuildContext context,
      ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: TextFormField(
        decoration: InputDecoration(
          hintStyle: TextStyle(color: getIconColor(context)),
          suffixIcon: hasSuffix ? suffixIcon : null,
          suffixIconColor: getWhite(context),
          hintText: hint,
          focusColor: getWhite(context),
          iconColor: getWhite(context),
          border: UnderlineInputBorder(
              borderSide: BorderSide(color: getIconColor(context))),
          errorBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.red)),
          focusedBorder: radius
              ? UnderlineInputBorder(
              borderSide: BorderSide(color: getIconColor(context)))
              : OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            //<-- SEE HERE
            borderSide:
            BorderSide(width: 3, color: getIconColor(context)),
          ),
          focusedErrorBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: getIconColor(context))),
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: getIconColor(context))),
        ),
        obscureText: isObscure,
        keyboardType: inputType,
        controller: controller,
        maxLines: maxLine,
        validator: validator,
        textAlign: textAlign,
        style: TextStyle(fontSize: 16, color: getBlack(context)),
        minLines: 1,
      ),
    );
  }
}



class CustomTextBox extends StatelessWidget {
  const CustomTextBox({Key? key, this.hint = "", this.prefix, this.suffix, this.controller})
      : super(key: key);
  final String hint;
  final Widget? prefix;
  final Widget? suffix;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.only(bottom: 3),
      height: 44,
      decoration: BoxDecoration(
          color: textBoxColor,
          border: Border.all(color: textBoxColor),
          borderRadius: BorderRadius.circular(10)),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
            prefixIcon: prefix,
            suffixIcon: suffix,
            border: InputBorder.none,
            hintText: hint,
            hintStyle: const TextStyle(color: darker, fontSize: 15)),
      ),
    );
  }
}
