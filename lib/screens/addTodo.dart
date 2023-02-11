import 'dart:io';
import 'dart:math';
import 'package:form_validator/form_validator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:tpcoursapi/components/app_button_round.dart';
import 'package:tpcoursapi/components/app_inputv2.dart';
import 'package:tpcoursapi/utils/app_func.dart';

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
  String? imagPath;



  @override
  void initState() {
    titleController=TextEditingController();
    descriptionController=TextEditingController();
    priotity=TextEditingController();
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
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 15,vertical: 20),
          width: double.infinity,
          height: getSize(context).height,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 15,),
              Text("Ajouter une nouvel tache a faire",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.redAccent,
                    fontWeight: FontWeight.bold,
                    fontSize: 25
                ),),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(

                  child:Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      (imagPath==null)?Icon(Icons.camera,size: 128,):
                      Image.file(File(imagPath!)),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          IconButton(onPressed: ()=>takePicture(ImageSource.camera), icon: Icon(Icons.camera_alt)),
                          IconButton(onPressed: ()=>takePicture(ImageSource.gallery), icon: Icon(Icons.photo_library_outlined))
                        ],
                      ),
                      AppInputv2(label: "Title",controller: titleController, validationBuilder: ValidationBuilder()),
                      AppInputv2(label: "Description",maxlines: 5,controller: descriptionController, validationBuilder: ValidationBuilder()),
                      AppInputv2(label: "priority",controller: priotity, validationBuilder: ValidationBuilder()),


                      SizedBox(height: 15,),
                      AppButtonRound('Creer une tache',onTap: addPressed,)

                    ],
                  ) ,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  takePicture(ImageSource source) async {
    XFile? xfile=await ImagePicker().pickImage(source: source);
    if (xfile==null) return;
    setState(() {
      imagPath=xfile!.path;
    });
  }

  addPressed(){
    print("hi");
    FocusScope.of(context).requestFocus(FocusNode());
    if (titleController.text.isEmpty) return;
    Map<String,dynamic> map={

    };
    map["title"]=titleController.text;
    map["description"]=descriptionController.text;
    map["priority"]=priotity.text;
    map["deadline_at"]="";
    map["id"]=1;



    //if (imagPath!=null) map["image"]=imagPath!;

    print(map);
    Todo todo=Todo.fromJson(map);
    print("h");
    DatabaseClient().upsert(todo).then((value) => Navigator.of(context).pop());

    print("f");


  }
}