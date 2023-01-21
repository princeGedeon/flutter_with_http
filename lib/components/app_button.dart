import 'package:flutter/material.dart';

import '../utils/app_styles.dart';

class AppButton extends StatelessWidget {
  AppButton(
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
          borderRadius: BorderRadius.circular(width /16),
        ),
        child: child,
      ),
    );
  }
}
