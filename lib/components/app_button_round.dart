import 'package:flutter/material.dart';

import '../../utils/app_func.dart';
import 'app_text.dart';

class AppButtonRound extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final Color textColor;
  final Color progressColor;
  final bool isLoading;
  final bool isEnable;
  final FontWeight weight;
  final void Function()? onTap;

  const AppButtonRound(this.text,
      {Key? key,
      this.backgroundColor = Colors.black,
      this.textColor = Colors.white,
      this.isLoading = false,
      this.isEnable = true,
      this.progressColor = Colors.white,
      this.weight = FontWeight.normal,
      this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
          child: Center(
            child: isLoading
                ? SizedBox(
                    height: 30,
                    width: 30,
                    child: CircularProgressIndicator(
                      backgroundColor: progressColor,
                    ),
                  )
                : AppText(
                    text,
                    weight: weight,
                    isNormal: false,
                    color: isEnable == false
                        ? textColor.withOpacity(0.7)
                        : textColor,
                    size: 18,
                  ),
          ),
          height: 50,
          margin: const EdgeInsets.symmetric(horizontal: 20),
          width: getSize(context).width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color:
                isLoading ? backgroundColor.withOpacity(0.5) : backgroundColor,
          )),
    );
  }
}
