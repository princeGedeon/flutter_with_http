import 'package:flutter/material.dart';
import 'package:tpcoursapi/screens/AProposPage.dart';
import 'package:tpcoursapi/screens/TodoListApi.dart';
import 'package:tpcoursapi/screens/TodoListSql.dart';
import 'package:tpcoursapi/screens/homepage.dart';
import 'package:tpcoursapi/utils/app_func.dart';

class Constant {
  static final BASE_URL = "http://192.168.43.223:3030/";

  static const USERNAME_PREF_KEY = "username";
  static const EMAIL_PREF_KEY = "email";
  static const TOKEN_PREF_KEY = "token";
  static const USER_ID_PREF_KEY = "userID";
}

Drawer myDrawer(BuildContext context) => Drawer(
        child: Column(
      children: [
        SizedBox(
          height: 100,
        ),
        InkWell(
          child: ListTile(
            leading: Icon(Icons.home),
            title: Text("Home"),
          ),
          onTap: (() {
            navigateToNextPage(context, HomeScreen());
          }),
        ),
        Divider(),
        InkWell(
          child: ListTile(
            leading: Icon(Icons.task_alt),
            title: Text("Mes todos"),
          ),
          onTap: (() {
            navigateToNextPage(context, TodoListAPI());
          }),
        ),
        Divider(),
        InkWell(
          child: ListTile(
            leading: Icon(Icons.task),
            title: Text("Mes todos hors-ligne"),
          ),
          onTap: (() {
            navigateToNextPage(context, TodoListSql());
          }),
        ),
        Divider(),
        InkWell(
          child: ListTile(
            leading: Icon(Icons.info),
            title: Text("A propos"),
          ),
          onTap: (() {
            navigateToNextPage(context, AboutPage());
          }),
        ),
        Divider(),
      ],
    ));
  bool isloading_home = true;
