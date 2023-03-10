import 'package:dio/dio.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tpcoursapi/data/models/todo.dart';

import '../../utils/constants.dart';
import '../../../data/models/post.dart';

class ToDoService {
  static Future<Todo> create(data) async {
    Fluttertoast.showToast(msg: "Patientez");
    final prefs = await SharedPreferences.getInstance();
    final String token = prefs.getString(Constant.TOKEN_PREF_KEY) ?? '';
    print('je vais inserer 2');
    print("data : $data");
    var response = await Dio().post(Constant.BASE_URL + 'todos',
        data: data,
        options: Options(headers: {"authorization": "Bearer $token"}));
    print('j ai inseré');

    Fluttertoast.showToast(backgroundColor: Colors.green, msg: "Tâche créée!");
    return Todo.fromJson(response.data);
  }

  static Future<List<Todo>> fetch({queryParameters = null}) async {
    final prefs = await SharedPreferences.getInstance();
    final String token = prefs.getString(Constant.TOKEN_PREF_KEY) ?? '';
    print(token);
    var response;
    try {
      response = await Dio().get(Constant.BASE_URL + 'todos',
          queryParameters: queryParameters,
          options: Options(headers: {"authorization": "Bearer $token"}));
      print("RÉPONSE ${response}");
      isloading_home = false;
    } catch (e, s) {
      print("Exception $e");
      print("StackTrace $s");
    }
    if (response.data == []) {
      return [];
    } else {
      return (response.data! /* ['data'] */ as List)
          .map((x) => Todo.fromJson(x))
          .toList();
    }
  }

  static Future<Todo> get(id, {queryParameters = null}) async {
    final prefs = await SharedPreferences.getInstance();
    final String token = prefs.getString(Constant.TOKEN_PREF_KEY) ?? '';

    var response = await Dio().get(Constant.BASE_URL + 'todos/' + id,
        queryParameters: queryParameters,
        options: Options(headers: {"authorization": "Bearer $token"}));

    return Todo.fromJson(response.data);
  }

  static Future<Todo> patch(id, data) async {
    Fluttertoast.showToast(msg: "Patientez");
    final prefs = await SharedPreferences.getInstance();
    final String token = prefs.getString(Constant.TOKEN_PREF_KEY) ?? '';

    var response = await Dio().patch(Constant.BASE_URL + 'todos/' + id,
        data: data,
        options: Options(headers: {"authorization": "Bearer $token"}));
    Fluttertoast.showToast(
        backgroundColor: Colors.green, msg: "Tâche modifiée !");

    return Todo.fromJson(response.data);
  }

  static Future<Todo> begin(id) async {
    Fluttertoast.showToast(msg: "Patientez");
    final prefs = await SharedPreferences.getInstance();
    final String token = prefs.getString(Constant.TOKEN_PREF_KEY) ?? '';

    var response = await Dio().patch(Constant.BASE_URL + 'todos/' + id,
        data: {"begined_at": DateTime.now().toString()},
        options: Options(headers: {"authorization": "Bearer $token"}));

    Fluttertoast.showToast(
        backgroundColor: Colors.green, msg: "Tâche démarée !");
    return Todo.fromJson(response.data);
  }

  static Future<Todo> finish(id) async {
    Fluttertoast.showToast(msg: "Patientez");
    final prefs = await SharedPreferences.getInstance();
    final String token = prefs.getString(Constant.TOKEN_PREF_KEY) ?? '';

    var response = await Dio().patch(Constant.BASE_URL + 'todos/' + id,
        data: {"finished_at": DateTime.now().toString()},
        options: Options(headers: {"authorization": "Bearer $token"}));

    Fluttertoast.showToast(
        backgroundColor: Colors.green, msg: "Tâche terminée!");
    return Todo.fromJson(response.data);
  }

  static Future<Todo> delete(id, data) async {
    final prefs = await SharedPreferences.getInstance();
    final String token = prefs.getString(Constant.TOKEN_PREF_KEY) ?? '';

    var response = await Dio().delete('${Constant.BASE_URL}todos/' + id,
        options: Options(headers: {"authorization": "Bearer $token"}));

    return Todo.fromJson(response.data);
  }
}
