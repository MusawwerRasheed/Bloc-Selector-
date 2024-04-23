

import 'package:notifications/BlocSelectorApi/Application/Services/ApiServices/api_services.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

 
class postsRepository {
   static Future<List<Map<String, dynamic>>> getPosts() async {

    try {
      return await Api.getPosts().then(
            (value) {
          return value;
        },
      ).catchError((e) {
        throw e;
      });
    } catch (e) {
      print('Error in posts repository: $e');
      rethrow;
    }
  }
}
