import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;


class Api {
  static const String baseUrl = 'https://jsonplaceholder.typicode.com';
  static const String url = 'posts';

  static Future<List<dynamic>> getPosts() async {
    log('inside of the                     services');
    try {
      final apiUrl = Uri.parse('$baseUrl/$url');
      print('URI PARSING: $apiUrl');
      final headers = {
        'Content-Type': 'application/json',
      };

      final response = await http.get(apiUrl);
      

      if (response.statusCode == 200) {
        print('success');  
          
         List<dynamic> data = json.decode(response.body);
          
           print(' does not executes');
         print(data);
            
        return data;
      } else {
        throw Exception(
            'Failed to load data. Status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}
