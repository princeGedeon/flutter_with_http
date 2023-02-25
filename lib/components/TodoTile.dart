import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tpcoursapi/data/services/todoService.dart';
import 'package:tpcoursapi/screens/editTodo.dart';
import 'package:tpcoursapi/utils/app_func.dart';
import 'package:tpcoursapi/utils/constants.dart';

import '../data/models/todo.dart';

class TodoTile extends StatefulWidget {
  TodoTile({
    Key? key,
    required this.item,
  }) : super(key: key);
  Todo item;

  @override
  State<TodoTile> createState() => _TodoTileState();
}

class _TodoTileState extends State<TodoTile> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          ListTile(
            /* leading:  Container(
              color: Colors.blue,
              child: SizedBox(
                width: 5,
                child: Text(" "),
              ),
            ), */
            title: Text(widget.item.title),
            subtitle: Text(widget.item.description),
            onTap: () {},
          ),
          ButtonBar(
            alignment: MainAxisAlignment.start,
            children: [
              IconButton(
                  onPressed: () {
                    setState(() {
                      edit_description = widget.item.description;
                      edit_title = widget.item.title;
                      edit_priority = widget.item.priority;
                      edit_id = widget.item.id;
                    });
                    navigateToNextPage(context, EditTodoView());
                  },
                  icon: Icon(
                    Icons.edit,
                    color: Colors.blue,
                  )),
              IconButton(
                  disabledColor: Colors.grey,
                  onPressed: () {
                    if (widget.item.begined_at == null) {
                      print(widget.item.title);
                      print(DateTime.now().toString());
                      ToDoService.begin(widget.item.id);
                    } else {
                      Fluttertoast.showToast(
                          msg: "Cette tâche est déjà terminée");
                    }
                    setState(() {});
                  },
                  icon: Icon(
                    Icons.play_arrow,
                    color: Colors.blue,
                  )),
              IconButton(
                  onPressed: () {
                    if (widget.item.finished_at == null &&
                        widget.item.begined_at != null) {
                      print(widget.item.title);
                      print(DateTime.now().toString());
                      ToDoService.finish(widget.item.id);
                    } else if (widget.item.finished_at != null) {
                      Fluttertoast.showToast(
                          msg: "Cette tâche est déjà terminée");
                    } else {
                      Fluttertoast.showToast(
                          msg: "Cette tâche n'a pas encore commencé");
                    }
                    setState(() {});
                  },
                  icon: Icon(
                    Icons.check_circle,
                    color: Colors.blue,
                  )),
            ],
          )
        ],
      ),
    );
  }
}
