import 'package:flutter/material.dart';
import 'package:tpcoursapi/components/app_text.dart';
import 'package:tpcoursapi/data/models/todo.dart';
import 'package:tpcoursapi/screens/addTodo.dart';
import 'package:tpcoursapi/utils/app_func.dart';
import 'package:tpcoursapi/utils/constants.dart';

import '../data/services/DatabaseClient.dart';

class TodoListSql extends StatefulWidget {
  const TodoListSql({Key? key}) : super(key: key);

  @override
  State<TodoListSql> createState() => _TodoListSqlState();
}

class _TodoListSqlState extends State<TodoListSql> {
  List<Todo> todos = [];
  @override
  void initState() {
    // TODO: implement initState
    getTodo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Accueil")),
      drawer: myDrawer(context),
      body: Container(
        width: double.infinity,
        height: getSize(context).height,
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            AppText(
              "Mes todos",
              size: 25,
            ),
            Divider(),
            Container(
                height: MediaQuery.of(context).size.height * 0.8,
                child: ListView.separated(
                    itemBuilder: (BuildContext context, index) {
                      return Card(
                          child: ListTile(
                        title: Text(todos[index].title),
                        subtitle: (todos[index].description.length > 50)
                            ? Text(todos[index].description.substring(0, 50))
                            : Text(todos[index].description),
                        onTap: () {},
                      ));
                    },
                    separatorBuilder: (BuildContext context, index) {
                      return Divider();
                    },
                    itemCount: todos.length)),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print("add");
          navigateToNextPage(context, AddTodoView());
        },
        child: Icon(Icons.add),
      ),
    );
  }

  getTodo() async {
    DatabaseClient().allTodos().then((value) {
      print(value);
      setState(() {
        this.todos = value;
      });
    });
  }
}
