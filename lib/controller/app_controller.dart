import 'package:flutter/material.dart';

import '../data/models/Menu_items.dart';

class AppController extends StatefulWidget{


  @override
  AppState createState()=>AppState();
}

class AppState extends State<AppController> {
  //Parametre
  int index=0;
  List<Menu_Item > Items=[
    Menu_Item(name: "Home", icon:Icon(Icons.access_alarms_rounded),body:Container()),
    Menu_Item(name: "Mes Todos",icon: Icon(Icons.keyboard_option_key), body: Container(child:Container(),)),
    Menu_Item(name: "Mon profil", icon: Icon(Icons.accessible_forward), body: Container(child: Text("Forum"),)),
    Menu_Item(name: "A propos", icon: Icon(Icons.keyboard_option_key), body: Container(child: Text("mon_profil"),)),
  ];

  @override
  void initState(){
    super.initState();
  }

  @override
  void dispose(){
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xE5E5E5),
      ),
      drawer: Drawer(
        child: ListView.builder(itemBuilder: (context,index){
          return (index==0)?drawerHeader():tileFromIndex(index);
        },
          itemCount: 6,),

      ),
      body: Items[index].body,
    );
  }

  DrawerHeader drawerHeader(){
    return DrawerHeader(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(Icons.book),
          Text("Todo of Prince")
        ],
      ),
    );
  }

  ListTile tileFromIndex(int index){
    final new_index=index-1;
    final item=Items[new_index];
    return ListTile(
      leading: item.icon,
      title: Text(item.name),
      onTap: (){
        setState((){
          this.index=new_index;
          Navigator.pop(context);
        });

      },

    );
  }



}
