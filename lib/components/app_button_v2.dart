import 'package:flutter/material.dart';

import '../utils/app_styles.dart';

// ignore: must_be_immutable
class AppButtonv2 extends StatelessWidget {
  AppButtonv2(
      {Key? key,
        required this.height,
        required this.width,
        required this.child,
        required this.onTap})
      : super(key: key);
  double height;
  double width;
  Widget child;
  void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: getBackCont(context),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(child: child),
      ),
    );
  }
}