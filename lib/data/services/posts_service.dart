import 'package:blog/data/models/post.dart';

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/constants.dart';

class PostService {

  static Future<Post> create (data) async {
    final prefs = await SharedPreferences.getInstance();
    final String token = prefs.getString(Constant.TOKEN_PREF_KEY) ?? '' ;

    var response = await Dio().post(
        Constant.BASE_URL+'posts',
        data: data,
        options: Options(headers: {"authorization": "Bearer $token"})
    );

    return Post.fromJson(response.data) ;
  }

  static Future<List<Post>> fetch ({queryParameters = null}) async {
    final prefs = await SharedPreferences.getInstance();
    final String token = prefs.getString(Constant.TOKEN_PREF_KEY) ?? '' ;

    var response = await Dio().get(
        Constant.BASE_URL+'posts',
        queryParameters: queryParameters,
        options: Options(headers: {"authorization": "Bearer $token"})
    );

    return (response.data!['data'] as List).map((x) => Post.fromJson(x))
        .toList();
  }

  static Future<Post> get (id, {queryParameters = null}) async {
    final prefs = await SharedPreferences.getInstance();
    final String token = prefs.getString(Constant.TOKEN_PREF_KEY) ?? '' ;

    var response = await Dio().get(
        Constant.BASE_URL+'posts/'+id,
        queryParameters: queryParameters,
        options: Options(headers: {"authorization": "Bearer $token"})
    );

    return Post.fromJson(response.data);
  }

  static Future<Post> patch (id, data) async {
    final prefs = await SharedPreferences.getInstance();
    final String token = prefs.getString(Constant.TOKEN_PREF_KEY) ?? '' ;

    var response = await Dio().patch(
        Constant.BASE_URL+'posts/'+id,
        data: data,
        options: Options(headers: {"authorization": "Bearer $token"})
    );

    return Post.fromJson(response.data) ;
  }

  static Future<Post> delete (id, data) async {
    final prefs = await SharedPreferences.getInstance();
    final String token = prefs.getString(Constant.TOKEN_PREF_KEY) ?? '' ;

    var response = await Dio().delete(
        '${Constant.BASE_URL}posts/'+id,
        options: Options(headers: {"authorization": "Bearer $token"})
    );

    return Post.fromJson(response.data) ;
  }

}