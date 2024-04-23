

import 'dart:math';

import 'package:notifications/BlocSelectorApi/Application/Services/ApiServices/api_services.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

 
class PostsRepository {
  static Future<List<Map<String, dynamic>>> getPosts() async {
    try {
      List<dynamic> postsData = await Api.getPosts(); // Assuming Api.getPosts() returns List<dynamic>

      // Map each element of the list to Map<String, dynamic>
      List<Map<String, dynamic>> posts = postsData.map((post) {
        // Assuming each post is already a Map<String, dynamic>
        return post as Map<String, dynamic>;
      }).toList();

      print(posts);
      return posts;
    } catch (e) {
      print('Error in posts repository: $e');
      throw e; // Rethrow the error after logging
    }
  }
}
