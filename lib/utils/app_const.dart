import 'package:flutter/material.dart';
enum ENV_MODE{
  prod,
  dev
}

ENV_MODE currentEnv = ENV_MODE.prod;

enum AlertTypeH {
  success,
  error,
  warning
}

enum HistoryType {
  demande,
  remboursement,
  agent,
}

const primaryColor_ = AppColor.primary;
const accentColor = AppColor.secondary;
const secondaryColor = AppColor.secondary;
//const secondaryColor = Color(0xff368fc7);
const yellowColor = Color(0xfff8c614);

const shadowColor = Colors.black87;
const cardColor = Color(0xFFEDF0F3);
const darker = Color(0xFF3E4249);
const textBoxColor = Color(0xFFe9e9e9);


Color deepBlue = const Color(0xff466aff);
Color lightBlue = const Color(0xff5879ff);

Color sendBackgroundColor = const Color(0xffcfe3ff);
Color sendIconColor = const Color(0xff3f63ff);

Color activitiesBackgroundColor = const Color(0xfffbcfcf);
Color activitiesIconColor = const Color(0xfff54142);

Color statsBackgroundColor = const Color(0xffd3effe);
Color statsIconColor = const Color(0xff3fbbfe);

Color paymentBackgroundColor = const Color(0xffefcffe);
Color paymentIconColor = const Color(0xffef3fff);

Color? backgroundDefaultScaffold = Colors.grey[100];

const String default_user_pic = "https://madahst.com/wp-content/uploads/2020/08/ava.png";
const String default_dummy_user_pic = "http://www.azembelani.co.za/wp-content/uploads/2016/07/20161014_58006bf6e7079-3.png";

const urlFCM = "https://char-products.store/public/fcm_clavero.php";

enum FavLevel{
  none,
  like,
  unlike,
  bookmark,
  follow,
}


class TwitterColor {
  static Color bondiBlue = const Color.fromRGBO(0, 132, 180, 1.0);
  static Color cerulean = const Color.fromRGBO(0, 172, 237, 1.0);
  static Color spindle = const Color.fromRGBO(192, 222, 237, 1.0);
  static Color white = const Color.fromRGBO(255, 255, 255, 1.0);
  static Color black = const Color.fromRGBO(0, 0, 0, 1.0);
  static Color woodsmoke = const Color.fromRGBO(20, 23, 2, 1.0);
  static Color woodsmoke_50 = const Color.fromRGBO(20, 23, 2, 0.5);
  static Color mystic = const Color.fromRGBO(230, 236, 240, 1.0);
  static Color dodgeBlue = const Color.fromRGBO(29, 162, 240, 1.0);
  static Color dodgeBlue_50 = const Color.fromRGBO(29, 162, 240, 0.5);
  static Color paleSky = const Color.fromRGBO(101, 119, 133, 1.0);
  static Color ceriseRed = const Color.fromRGBO(224, 36, 94, 1.0);
  static Color paleSky50 = const Color.fromRGBO(101, 118, 133, 0.5);
}

class AppColor {
  static const Color primary = Color(0xfff2ae2b);
  static const Color secondary = Color(0xff004aad);
  static const Color darkGrey = Color(0xff1657786);
  static const Color lightGrey = Color(0xffAAB8C2);
  static const Color extraLightGrey = Color(0xffE1E8ED);
  static const Color extraExtraLightGrey = Color(0xfF5F8FA);
  static const Color white = Color(0xFFffffff);
}