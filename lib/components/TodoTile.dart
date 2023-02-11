import 'package:flutter/material.dart';

import '../data/models/todo.dart';



class TodoTile extends StatelessWidget {
  TodoTile({Key? key,required this.item,required this.onDelete,required this.onPressed}) : super(key: key);
  Todo item;
  Function(Todo) onPressed;
  Function(Todo) onDelete;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(item.title),
      subtitle: Text(item.description),
      onTap: (()=>onPressed(item)),
      trailing: IconButton(
          onPressed:(()=>onDelete(item)),
          icon:Icon(Icons.delete)
      ),
    );
  }
}