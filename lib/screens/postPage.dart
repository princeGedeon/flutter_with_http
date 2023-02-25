import 'package:flutter/material.dart';
import 'package:tpcoursapi/data/services/posts_service.dart';
import 'package:tpcoursapi/screens/addPost.dart';
import 'package:tpcoursapi/utils/app_func.dart';

import '../components/app_text.dart';
import '../data/models/post.dart';

class PostPage extends StatefulWidget {
  const PostPage({super.key});

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  List<Post> posts = [];
  bool loading = false;

  @override
  void initState() {
    // TODO: implement initState
    fetchPosts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Créer un post"),
      ),
      body: loading
          ? Center(child: CircularProgressIndicator())
          : posts.isEmpty
              ? Center(
                  child: AppText("La liste de postes est vide"),
                )
              : Padding(
                  padding: EdgeInsets.all(2),
                  child: ListView.builder(
                      itemCount: posts.length,
                      itemBuilder: (context, index) {
                        final item = posts[index];
                        return ListTile(
                          leading: Icon(Icons.description_outlined),
                          title: Text(
                            item.title ?? "",
                            maxLines: 1,
                          ),
                          subtitle: Text(
                              "Créé par ${item.user!.username} le ${item.updatedAt}"),
                        );
                      }),
                ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          navigateToNextPage(context, CreatePost());
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void fetchPosts() async {
    try {
      loading = true;
      posts = await PostService.fetch();
      setState(() {});
    } catch (e) {
      print(e);
    } finally {
      setState(() {
        loading = false;
      });
    }
  }
}
