import 'package:dio/dio.dart';
import 'package:flutter_application_3/model/posts.dart';

class Fetchdata {
  // Future<List<Post>?> getdata() async {
  //   List<Post> post = [];
  //   final dio = Dio();
  //   final response = await dio.get(
  //       'https://non14.net/api/v2/posts?limit=10&local=0&search=&categories=13,10&order=desc');
  //   var body = response.data;
  //   if (response.statusCode == 200) {
  //     for (var item in body) {
  //       post.add(Post.fromJson(item));
  //     }
  //   } else {
  //     'error';
  //   }
  //   return post;
  // }
  Future<List<Data>> getdatum() async {
    List<Data> datum = [];
    final dio = Dio();
    final response = await dio.get('https://non14.net/api/v2/posts?order=desc');
    var body2 = response.data;

    if (response.statusCode == 200) {
      for (var item2 in body2['data']) {
        datum.add(Data.fromJson(item2));
      }
    } else {
      'error line';
    }
    return datum;
  }

  Future<List<PostCategory>> getcat() async {
    List<PostCategory> cat = [];
    final dio = Dio();
    final response2 = await dio.get('https://non14.net/api/v2/categories');
    var body3 = response2.data;
    if (response2.statusCode == 200) {
      for (var item3 in body3) {
        cat.add(PostCategory.fromJson(item3));
      }
    } else {
      'error line';
    }
    return cat;
  }

  Future<List<Data>> getpostcat(
      {categories = 0, limit = 10, order = 'desc', search = ''}) async {
    List<Data> postcat = [];
    final dio = Dio();
    final response = await dio.get(
        'https://non14.net/api/v2/posts?limit=$limit&local=0&search=$search&categories=$categories&order=$order');
    var body2 = response.data;

    if (response.statusCode == 200) {
      for (var item2 in body2['data']) {
        postcat.add(Data.fromJson(item2));
      }
    } else {
      'error line';
    }
    return postcat;
  }
}
