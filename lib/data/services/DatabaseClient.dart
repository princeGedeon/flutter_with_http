import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../models/todo.dart';

class DatabaseClient{

  //INTEGER, TEXT, REAL,
  //INTEGER PRIMARY KEY pour id unique
  // TEXT NOT NULL

  //Accéder à la database
  Database? _database;
  Future<Database> get database async{
    if (_database!=null) return _database!;
    return await createDatabase();
  }

  Future<Database> createDatabase() async{

    Directory directory=await getApplicationDocumentsDirectory();
    final path=join(directory.path,"database.db");

    return await openDatabase(path,version: 1,
        onCreate: onCreate
    );

  }
  onCreate(Database database,int version) async{
    await database.execute('''
      CREATE TABLE Todo (
      id INTEGER PRIMARY KEY,
      title TEXT NOT NULL,
      priority TEXT NOT NULL,
      deadline_at TEXT NOT NULL,);
    ''');


  }


  Future<List<Todo>> allTodos() async{
    Database db=await database;
    const query="SELECT * FROM Todo";

    List<Map<String,dynamic>> mapList= await db.rawQuery(query);
    return mapList.map((e) => Todo.fromJson(e)).toList();
  }

  Future<List<Todo>> TodoFromId(int id) async{
    Database db=await database;
    List<Map<String,dynamic>> mapList=await db.query('Todo',where:"id = ?",
        whereArgs: [id]);
    print(mapList);

    return mapList.map((e) => Todo.fromJson(e)).toList();


  }

  Future<bool> addTodoList (Todo todo) async{
    Database db=await database;

    await db.insert("Todo", {

      "title":todo.title,
      "description":todo.description,
      "priority":todo.priority,
      "deadline_at":todo.deadline_at
    });

    return true;
  }

  Future<bool> removeItem(Todo todo) async{
    Database db=await database;
    await db.delete('Todo',where: "id = ?",whereArgs:[todo.id]);


    return true;
  }


  Future<bool> upsert(Todo todo) async{
    Database db=await database;
    (todo.id==null)?
    todo.id=await db.insert('Todo', todo.toMap()):
    await db.update('Todo',todo.toMap(), where:"id=?",whereArgs: [todo.id]);

    return true;

  }



}