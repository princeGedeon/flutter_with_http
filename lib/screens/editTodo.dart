import 'dart:math';
import 'package:form_validator/form_validator.dart';
import 'package:flutter/material.dart';
import 'package:tpcoursapi/components/app_inputv2.dart';
import 'package:tpcoursapi/data/services/todoService.dart';
import 'package:tpcoursapi/screens/TodoListApi.dart';
import 'package:tpcoursapi/utils/app_func.dart';
import 'package:tpcoursapi/utils/constants.dart';

import '../data/models/todo.dart';
import '../data/services/DatabaseClient.dart';

class EditTodoView extends StatefulWidget {
  EditTodoView({Key? key,required this.task}) : super(key: key);
  Todo task;

  @override
  State<EditTodoView> createState() => _EditTodoViewState();
}

class _EditTodoViewState extends State<EditTodoView> {
  late TextEditingController titleController;
  late TextEditingController descriptionController;
  late TextEditingController priotity;
  String? imagPath;

  @override
  void initState() {
    titleController = TextEditingController();
    descriptionController = TextEditingController();
    priotity = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    titleController.dispose();
    descriptionController.dispose();
    priotity.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Modifiez votre tâche")),
      drawer: myDrawer(context),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            width: double.infinity,
            height: getSize(context).height,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 15,
                ),
                Text(
                  "Modifiez les informations de votre tâche",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.redAccent,
                      fontWeight: FontWeight.bold,
                      fontSize: 25),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AppInputv2(
                            label: "Titre",
                            initialValue: widget.task.title,
                            controller: titleController,
                            validationBuilder: ValidationBuilder()),
                        AppInputv2(
                            label: "Description",
                            initialValue: widget.task.description,
                            maxlines: 5,
                            controller: descriptionController,
                            validationBuilder: ValidationBuilder()),
                        AppInputv2(
                            label: "Priorité",
                            initialValue: widget.task.priority,
                            controller: priotity,
                            validationBuilder: ValidationBuilder()),
                        SizedBox(
                          height: 15,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            print("hi");
                            addPressed();
                          },
                          child: Text("Creer une tache"),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  addPressed() {
    print("hi");
    FocusScope.of(context).requestFocus(FocusNode());
    if (titleController.text.isEmpty) return;
    Map<String, dynamic> map = {};
    Random random = new Random();
    map["title"] = titleController.text;
    map["description"] = descriptionController.text;
    map["priority"] = priotity.text;
    map["deadline_at"] = "2022-12-10 12:00:00";

    //if (imagPath!=null) map["image"]=imagPath!;

    print(map);
    Todo todo = Todo.fromJson(map);
    print("h");
    ToDoService.patch(widget.task.id, map);
    DatabaseClient()
        .addTodoList(todo)
        .then((value) => /* Navigator.of(context).pop() */ {});
    navigateToNextPage(context, TodoListAPI());
    print("f");
  }
}
