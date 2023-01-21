import 'package:flutter/material.dart';
import 'package:tpcoursapi/components/app_text.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( toolbarHeight: 70,leading:Image.asset("assets/img/logo.jpg",),title: AppText("Liste des codes",color: Colors.white,size: 18,),),
      drawer: Drawer(),
      body: Center(
        child: Text("Hello"),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),

        onPressed: () {
        print('hello');
      },),
    );
  }
}
