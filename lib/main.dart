import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tpcoursapi/screens/homepage.dart';
import 'package:tpcoursapi/screens/loginpage.dart';
import 'package:tpcoursapi/utils/constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var pref = await SharedPreferences.getInstance();
  String token = pref.getString(Constant.TOKEN_PREF_KEY) ?? "";
  String begiPage = token != "" ? "home" : "login";
  runApp(MyApp(
    firstPage: begiPage,
  ));
}

class MyApp extends StatelessWidget {
  MyApp({super.key, required this.firstPage});
  final String firstPage;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: firstPage == "login" ? LoginPage() : HomeScreen(),
    );
  }
}
