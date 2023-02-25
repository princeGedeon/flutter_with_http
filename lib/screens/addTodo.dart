import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_validator/form_validator.dart';
import 'package:flutter/material.dart';
import 'package:tpcoursapi/components/app_inputv2.dart';
import 'package:tpcoursapi/data/services/todoService.dart';
import 'package:tpcoursapi/screens/TodoListApi.dart';
import 'package:tpcoursapi/utils/app_func.dart';
import 'package:tpcoursapi/utils/constants.dart';

import '../data/models/todo.dart';
import '../data/services/DatabaseClient.dart';

class AddTodoView extends StatefulWidget {
  AddTodoView({Key? key}) : super(key: key);

  @override
  State<AddTodoView> createState() => _AddTodoViewState();
}

class _AddTodoViewState extends State<AddTodoView> {
  late TextEditingController titleController;
  late TextEditingController descriptionController;
  late TextEditingController priotity;
  String my_date = "";
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
      appBar: AppBar(title: Text("Accueil")),
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
                  "Ajouter une nouvelle tâche a faire",
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
                            controller: titleController,
                            validationBuilder: ValidationBuilder()),
                        AppInputv2(
                            label: "Description",
                            maxlines: 5,
                            controller: descriptionController,
                            validationBuilder: ValidationBuilder()),
                        AppInputv2(
                            label: "Priorité",
                            controller: priotity,
                            validationBuilder: ValidationBuilder()),
                        SizedBox(
                          height: 15,
                        ),
                        TextButton(
                            onPressed: () {
                              DatePicker.showDateTimePicker(context,
                                  showTitleActions: true,
                                  minTime: DateTime(2018, 3, 5),
                                  maxTime: DateTime(2019, 6, 7),
                                  onChanged: (date) {
                                my_date = date.toString();
                              }, onConfirm: (date) {
                                my_date = date.toString();
                              },
                                  currentTime: DateTime.now(),
                                  locale: LocaleType.fr);
                            },
                            child: Text(
                              "Choisissez votre deadline",
                              style: TextStyle(color: Colors.blue),
                            )),
                        SizedBox(
                          height: 15,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            print("hi");
                            addPressed();
                          },
                          child: Text("Creer une tache"),
                        ),
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
    if (titleController.text.isEmpty ||
        descriptionController.text.isEmpty ||
        priotity.text.isEmpty) return;
    if (my_date == "") {
      Fluttertoast.showToast(
          msg: "Précisez une date!", backgroundColor: Colors.red);
      return;
    }
    Map<String, dynamic> map = {};
    Random random = new Random();
    map["title"] = titleController.text;
    map["description"] = descriptionController.text;
    map["priority"] = priotity.text;
    map["deadline_at"] = my_date;

    //if (imagPath!=null) map["image"]=imagPath!;

    print(map);
    Todo todo = Todo.fromJson(map);
    print("h");
    ToDoService.create(map);
    DatabaseClient()
        .addTodoList(todo)
        .then((value) => /* Navigator.of(context).pop() */ {});
    navigateToNextPage(
      context,
      TodoListAPI(),
    );
    print("f");
  }
}
