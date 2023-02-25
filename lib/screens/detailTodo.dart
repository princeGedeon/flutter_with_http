import 'package:flutter/material.dart';
import 'package:tpcoursapi/data/models/todo.dart';

import '../utils/app_func.dart';

class DetailTodo extends StatefulWidget {
  DetailTodo({Key? key, required this.task}) : super(key: key);
  Todo task;

  @override
  State<DetailTodo> createState() => _DetailTodoState();
}

class _DetailTodoState extends State<DetailTodo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Détails")),
        body: Container(
          width: double.infinity,
          height: getSize(context).height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ListTile(
                title: Text("Titre : ${widget.task.title}"),
              ),
              ListTile(
                title: Text("Description : ${widget.task.description}"),
              ),
              ListTile(
                title: Text("Priorité : ${widget.task.priority}"),
              ),
              ListTile(
                title: Text(
                    "Date de début : ${(widget.task.begined_at) ?? "..."}"),
              ),
              ListTile(
                title:
                    Text("Date de fin : ${(widget.task.finished_at) ?? "..."}"),
              ),
              ListTile(
                title: Text("Deadline : ${widget.task.deadline_at}"),
              )
            ],
          ),
        ));
  }
}
