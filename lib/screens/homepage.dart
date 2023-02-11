import 'package:flutter/material.dart';
import 'package:tpcoursapi/components/app_text.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return  Center(
        child: Text("Hello"),
      );

  }
}
