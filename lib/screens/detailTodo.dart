import 'package:flutter/material.dart';
import 'package:tpcoursapi/data/models/todo.dart';

import '../utils/app_func.dart';

class DetailTodo extends StatefulWidget {
  DetailTodo({Key? key,required this.task}) : super(key: key);
  Todo task;

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
        children: [
          
        ],
      ),
    ));
  }
}
