import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tpcoursapi/data/services/todoService.dart';

import '../data/models/todo.dart';

class TodoTile extends StatelessWidget {
  TodoTile(
      {Key? key,
      required this.item,
      required this.onDelete,
      required this.onPressed})
      : super(key: key);
  Todo item;
  Function(Todo) onPressed;
  Function(Todo) onDelete;
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
            title: Text(item.title),
            subtitle: Text(item.description),
            onTap: (() => onPressed(item)),
          ),
          ButtonBar(
            alignment: MainAxisAlignment.start,
            children: [
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.edit,
                    color: Colors.blue,
                  )),
              IconButton(
                  disabledColor: Colors.grey,
                  onPressed: () {
                    if (item.begined_at == null) {
                      print(item.title);
                      print(DateTime.now().toString());
                      ToDoService.begin(item.id);
                    } else {
                      Fluttertoast.showToast(
                          msg: "Cette tâche est déjà terminée");
                    }
                  },
                  icon: Icon(
                    Icons.play_arrow,
                    color: Colors.blue,
                  )),
              IconButton(
                  onPressed: () {
                    if (item.finished_at == null && item.begined_at != null) {
                      print(item.title);
                      print(DateTime.now().toString());
                      ToDoService.finish(item.id);
                    } else if (item.finished_at != null) {
                      Fluttertoast.showToast(
                          msg: "Cette tâche est déjà terminée");
                    } else {
                      Fluttertoast.showToast(
                          msg: "Cette tâche n'a pas encore commencé");
                    }
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
