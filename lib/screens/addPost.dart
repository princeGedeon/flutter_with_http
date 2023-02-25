import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:tpcoursapi/components/app_button_round.dart';
import 'package:tpcoursapi/components/app_text.dart';
import 'package:tpcoursapi/screens/postPage.dart';
import 'package:tpcoursapi/utils/app_func.dart';

import '../data/services/posts_service.dart';

class CreatePost extends StatefulWidget {
  const CreatePost({super.key});

  @override
  State<CreatePost> createState() => _CreatePostState();
}

class _CreatePostState extends State<CreatePost> {
  late TextEditingController titleController;
  late TextEditingController contentController;
  bool loading = false;

  var formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    titleController = TextEditingController();
    contentController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    titleController.dispose();
    contentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Nouveau Poste"),
      ),
      body: Padding(
        padding: EdgeInsets.all(2.0),
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          AppText("Créer un nouveau Poste"),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
            child: Form(
              child: Column(
                children: [
                  TextFormField(
                    controller: titleController,
                    decoration: InputDecoration(
                        labelText: "Titre",
                        hintText: "Entrez le titre ou poste"),
                    validator: (String? title) {
                      return title == null || title == ""
                          ? "Le titre ne doit pas etre vide"
                          : "";
                    },
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    maxLines: 3,
                    controller: contentController,
                    decoration: InputDecoration(
                        labelText: "Contenu",
                        hintText: "Entrez le contenu ou poste"),
                    validator: (String? title) {
                      return title == null || title == ""
                          ? "Le contenu ne doit pas etre vide"
                          : "";
                    },
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  ElevatedButton(
                    child: loading
                        ? CircularProgressIndicator()
                        : Text("Enregistrer"),
                    onPressed: () {
                      createPost(titleController.text, contentController.text);
                      if (formKey.currentState!.validate()) {
                        print("hu");
                      }
                    },
                  )
                ],
              ),
              key: formKey,
            ),
          ),
          TextButton(
              onPressed: () {
                navigateToNextPage(context, PostPage(), back: false);
              },
              child: Text("Voir les listes de postes"))
        ]),
      ),
    );
  }

  Future<void> createPost(String title, String contenu) async {
    setState(() {
      loading = true;
    });

    try {
      await PostService.create(
          {'title': titleController.text, 'content': contentController.text});
      titleController.text = "";
      contentController.text = "";
    } catch (e) {
      print(e);
    } finally {
      setState(() {
        loading = false;
      });
    }
  }
}
