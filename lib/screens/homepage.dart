import 'package:flutter/material.dart';
import 'package:tpcoursapi/components/TodoTile.dart';
import 'package:tpcoursapi/components/app_text.dart';
import 'package:tpcoursapi/data/models/todo.dart';
import 'package:tpcoursapi/data/services/todoService.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Card(
                color: Color.fromARGB(255, 207, 98, 134),
                child: SizedBox(
                  width: width * 0.8,
                  height: 100,
                  child: Center(child: Text("Nombre total de tâches : $nbr")),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text("Tâches non commencées"),
            Container(
              margin: EdgeInsets.only(top: 20),
              height: 50,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  final Todo item = myTasks[index];
                  if (item.begined_at == null) {
                    print(1);
                    return Card(
                      color: Color.fromARGB(255, 72, 77, 117),
                      child: SizedBox(
                        /* 
                        width: width * 0.4, */
                        height: 100,
                        child: Container(
                            margin: EdgeInsets.all(5), child: Text(item.title)),
                      ),
                    );
                  } else {
                    return Container();
                  }
                }, //41171075
                itemCount: myTasks.length,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text("Tâches en cours"),
            Container(
              margin: EdgeInsets.only(top: 20),
              height: 50,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  final Todo item = myTasks[index];
                  if (item.begined_at != null && item.finished_at == null) {
                    print(1);
                    return Card(
                      color: Color.fromARGB(255, 72, 77, 117),
                      child: SizedBox(
                        /* 
                        width: width * 0.4, */
                        height: 100,
                        child: Container(
                            margin: EdgeInsets.all(5), child: Text(item.title)),
                      ),
                    );
                  } else {
                    return Container();
                  }
                }, //41171075
                itemCount: myTasks.length,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text("Tâches terminées"),
            Container(
              margin: EdgeInsets.only(top: 20),
              height: 50,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  final Todo item = myTasks[index];
                  if (item.begined_at != null && item.finished_at != null) {
                    print(1);
                    return Card(
                      color: Color.fromARGB(255, 72, 77, 117),
                      child: SizedBox(
                        /* 
                        width: width * 0.4, */
                        height: 100,
                        child: Container(
                            margin: EdgeInsets.all(5), child: Text(item.title)),
                      ),
                    );
                  } else {
                    return Container();
                  }
                }, //41171075
                itemCount: myTasks.length,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text("Tâches terminées avec retard"),
            Container(
              margin: EdgeInsets.only(top: 20),
              height: 50,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  final Todo item = myTasks[index];
                  if (item.begined_at != null &&
                      item.finished_at != null &&
                      DateTime.parse(item.deadline_at)
                              .compareTo(DateTime.parse(item.finished_at!)) <
                          0) {
                    return Card(
                      color: Color.fromARGB(255, 72, 77, 117),
                      child: SizedBox(
                        /* 
                        width: width * 0.4, */
                        height: 100,
                        child: Container(
                            margin: EdgeInsets.all(5), child: Text(item.title)),
                      ),
                    );
                  } else {
                    return Container();
                  }
                }, //41171075
                itemCount: myTasks.length,
              ),
            )
          ],
        ),
      ),
    );
  }
}
