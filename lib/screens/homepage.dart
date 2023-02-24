import 'package:flutter/material.dart';
import 'package:tpcoursapi/components/TodoTile.dart';
import 'package:tpcoursapi/components/app_text.dart';
import 'package:tpcoursapi/data/models/todo.dart';
import 'package:tpcoursapi/data/services/todoService.dart';
import 'package:tpcoursapi/screens/addTodo.dart';
import 'package:tpcoursapi/utils/app_func.dart';
import 'package:tpcoursapi/utils/constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isloading = true;
  var myTasks;
  String nbr = "...";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetch();
  }

  void fetch() async {
    myTasks = await ToDoService.fetch();
    setState(() {
      nbr = myTasks.length.toString();
      isloading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    int nbr_started = 0,
        nbr_finished = 0,
        nbr_lately_finished = 0,
        nbr_non_started = 0;
    for (Todo task in myTasks) {
      if (task.begined_at != null) {
        nbr_started++;

        if (task.finished_at != null) {
          nbr_finished++;
          var finished = DateTime.parse(task.finished_at!);
          var deadline = DateTime.parse(task.deadline_at);

          if (finished.compareTo(deadline) > 0) {
            nbr_lately_finished++;
          }
        }
      } else {
        nbr_non_started++;
      }
    }

    return Scaffold(
      appBar: AppBar(title: Text("Accueil")),
      drawer: myDrawer(context),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print("add");
          navigateToNextPage(context, AddTodoView());
        },
        child: Icon(Icons.add),
      ),
      body: (!isloading)
          ? SingleChildScrollView(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      child: Card(
                        color: Colors.blue,
                        child: SizedBox(
                            width: width * 0.9,
                            child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Nombre total de tâches : "),
                                    Card(
                                      color: Color.fromARGB(255, 196, 194, 194),
                                      child: Container(
                                          padding: EdgeInsets.all(5),
                                          child: Text(nbr)),
                                    )
                                  ],
                                ))),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      child: Card(
                        color: Colors.red,
                        child: SizedBox(
                            width: width * 0.9,
                            child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Tâches non commencées : "),
                                    Card(
                                      color: Color.fromARGB(255, 196, 194, 194),
                                      child: Container(
                                          padding: EdgeInsets.all(5),
                                          child:
                                              Text(nbr_non_started.toString())),
                                    )
                                  ],
                                ))),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      child: Card(
                        color: Colors.green,
                        child: SizedBox(
                            width: width * 0.9,
                            child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Tâches en cours : "),
                                    Card(
                                      color: Color.fromARGB(255, 196, 194, 194),
                                      child: Container(
                                          padding: EdgeInsets.all(5),
                                          child: Text(nbr_started.toString())),
                                    )
                                  ],
                                ))),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      child: Card(
                        color: Color.fromARGB(255, 207, 98, 134),
                        child: SizedBox(
                            width: width * 0.9,
                            child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Tâches achevées : "),
                                    Card(
                                      color: Color.fromARGB(255, 196, 194, 194),
                                      child: Container(
                                          padding: EdgeInsets.all(5),
                                          child: Text(nbr_finished.toString())),
                                    )
                                  ],
                                ))),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      child: Card(
                        color: Colors.pinkAccent,
                        child: SizedBox(
                            width: width * 0.9,
                            child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Tâches achevées en retard : "),
                                    Card(
                                      color: Color.fromARGB(255, 196, 194, 194),
                                      child: Container(
                                          padding: EdgeInsets.all(5),
                                          child: Text(
                                              nbr_lately_finished.toString())),
                                    )
                                  ],
                                ))),
                      ),
                    ),
                  ],
                ),
              ),
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
