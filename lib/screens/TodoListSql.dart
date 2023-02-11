import 'package:flutter/material.dart';
import 'package:tpcoursapi/components/TodoTile.dart';
import 'package:tpcoursapi/components/app_text.dart';
import 'package:tpcoursapi/data/models/todo.dart';
import 'package:tpcoursapi/screens/addTodo.dart';
import 'package:tpcoursapi/utils/app_func.dart';

class TodoListSql extends StatefulWidget {
  const TodoListSql({Key? key}) : super(key: key);

  @override
  State<TodoListSql> createState() => _TodoListSqlState();
}

class _TodoListSqlState extends State<TodoListSql> {
  List<Todo> todos=[];
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:Container(
        width: double.infinity,
        height: getSize(context).height,
        child: Column(
          children: [
            SizedBox(height: 10,),
            AppText("Mes todos",size: 25,),
            Divider(),
            Container(
              height: MediaQuery.of(context).size.height*0.8,

                child: ListView.separated(itemBuilder: (BuildContext context,index){
                  return TodoTile(item: Todo(id:1, title: 'Test', description: '', priority: '', deadline_at: ''), onDelete: (Todo ) {  }, onPressed: (Todo ) {  },);
                }, separatorBuilder: (BuildContext context,index){
                  return Divider();
                }, itemCount: 8)

              ),


          ],
        ),

      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        print("add");
        navigateToNextPage(context, AddTodoView());
      },
        child: Icon(Icons.add),
      ),
    );
  }
}
