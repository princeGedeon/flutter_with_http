import 'package:blog/data/models/comment.dart';

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/constants.dart';

class CommentService {

  static Future<Comment> create (data) async {
    final prefs = await SharedPreferences.getInstance();
    final String token = prefs.getString(Constant.TOKEN_PREF_KEY) ?? '' ;

    var response = await Dio().post(
      Constant.BASE_URL+'comments',
      data: data,
      options: Options(headers: {"authorization": "Bearer $token"})
    );

    return Comment.fromJson(response.data) ;
  }

  static Future<List<Comment>> fetch ({queryParameters = null}) async {
    final prefs = await SharedPreferences.getInstance();
    final String token = prefs.getString(Constant.TOKEN_PREF_KEY) ?? '' ;

    var response = await Dio().get(
        Constant.BASE_URL+'comments',
        queryParameters: queryParameters,
        options: Options(headers: {"authorization": "Bearer $token"})
    );

    return (response.data!['data'] as List).map((x) => Comment.fromJson(x))
        .toList();
  }

  static Future<Comment> get (id, {queryParameters = null}) async {
    final prefs = await SharedPreferences.getInstance();
    final String token = prefs.getString(Constant.TOKEN_PREF_KEY) ?? '' ;

    var response = await Dio().get(
        Constant.BASE_URL+'comments/'+id,
        queryParameters: queryParameters,
        options: Options(headers: {"authorization": "Bearer $token"})
    );

    return Comment.fromJson(response.data);
  }

  static Future<Comment> patch (id, data) async {
    final prefs = await SharedPreferences.getInstance();
    final String token = prefs.getString(Constant.TOKEN_PREF_KEY) ?? '' ;

    var response = await Dio().patch(
        Constant.BASE_URL+'comments/'+id,
        data: data,
        options: Options(headers: {"authorization": "Bearer $token"})
    );

    return Comment.fromJson(response.data);
  }

  static Future<Comment> delete (id, data) async {
    final prefs = await SharedPreferences.getInstance();
    final String token = prefs.getString(Constant.TOKEN_PREF_KEY) ?? '' ;

    var response = await Dio().delete(
        '${Constant.BASE_URL}comments/'+id,
        options: Options(headers: {"authorization": "Bearer $token"})
    );

    return Comment.fromJson(response.data) ;
  }

}