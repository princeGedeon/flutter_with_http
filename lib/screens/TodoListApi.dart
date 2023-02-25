import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tpcoursapi/components/app_text.dart';
import 'package:tpcoursapi/data/models/todo.dart';
import 'package:tpcoursapi/data/services/todoService.dart';
import 'package:tpcoursapi/screens/addTodo.dart';
import 'package:tpcoursapi/screens/editTodo.dart';
import 'package:tpcoursapi/utils/app_func.dart';
import 'package:tpcoursapi/utils/constants.dart';

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
    setState(() {});
    print("TAILLE : ${myTasks.length}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Vos tâches")),
      drawer: myDrawer(context),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          navigateToNextPage(context, AddTodoView());
        },
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          final Todo item = myTasks[index];
          return ApiTodoTile(item);
        }, //41171075
        itemCount: myTasks.length,
      ),
    );
  }

  ApiTodoTile(Todo item) => Card(
        child: InkWell(
          onTap: () {},
          child: Column(
            children: [
              ListTile(
                enabled: false,
                title: Text(item.title),
                subtitle: Text(item.description),
                onTap: () {},
              ),
              ButtonBar(
                alignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                      onPressed: () {
                        if (item.finished_at == null) {
                          navigateToNextPage(
                              context,
                              EditTodoView(
                                task: item,
                              ));
                        } else {
                          Fluttertoast.showToast(
                              msg: "Cette tâche est déjà terminée ");
                        }
                      },
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
                          setState(() {
                            navigateToNextPage(context, TodoListAPI(),
                                back: false);
                          });
                        } else if (item.finished_at == null) {
                          Fluttertoast.showToast(
                              msg: "Cette tâche a déjà démarré");
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
                        if (item.finished_at == null &&
                            item.begined_at != null) {
                          print(item.title);
                          print(DateTime.now().toString());
                          ToDoService.finish(item.id);
                          setState(() {
                            navigateToNextPage(context, TodoListAPI(),
                                back: false);
                          });
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
        ),
      );
}
