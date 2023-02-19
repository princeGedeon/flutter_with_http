import 'package:flutter/material.dart';
import 'package:tpcoursapi/components/app_text.dart';
import 'package:tpcoursapi/data/models/todo.dart';
import 'package:tpcoursapi/data/services/todoService.dart';
import 'package:tpcoursapi/screens/addTodo.dart';
import 'package:tpcoursapi/utils/app_func.dart';

import '../components/TodoTile.dart';

class TodoListAPI extends StatefulWidget {
  const TodoListAPI({Key? key}) : super(key: key);

  @override
  State<TodoListAPI> createState() => _TodoListAPIState();
}

class _TodoListAPIState extends State<TodoListAPI> {
  List<Todo> myTasks = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetch();
  }

  void fetch() async {
    myTasks = await ToDoService.fetch();
    setState(() {

    });
    print("TAILLE : ${myTasks.length}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {
        print("add");
        navigateToNextPage(context, AddTodoView());
      }),
      body: ListView.builder(
        itemBuilder: (context, index) {
          final Todo  item=myTasks[index];
          return  TodoTile(item: item, onDelete: (Todo ) {  }, onPressed: (Todo ) {  },);
        },//41171075
        itemCount: myTasks.length,
      ),
    );
  }
}
