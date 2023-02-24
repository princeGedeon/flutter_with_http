import 'package:flutter/material.dart';

import '../utils/app_func.dart';

class DetailTodo extends StatefulWidget {
  const DetailTodo({Key? key}) : super(key: key);

  @override
  State<DetailTodo> createState() => _DetailTodoState();
}

class _DetailTodoState extends State<DetailTodo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: double.infinity,
      height: getSize(context).height,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [],
      ),
    ));
  }
}
