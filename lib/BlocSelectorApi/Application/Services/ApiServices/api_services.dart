import 'dart:convert';
import 'package:http/http.dart' as http;

class Api {
  static const String baseUrl = 'https://jsonplaceholder.typicode.com/';
  static const String url = 'posts';

  static Future<List<Map<String, dynamic>>> getPosts() async {
    print('api services getposts gets executed');

    try {

      final apiUrl = Uri.parse('$baseUrl/$url');
      print('URI PARSING: $apiUrl');
      final headers = {
        'Content-Type': 'application/json',
      }; 

      final response = await http.get(apiUrl);

      if (response.statusCode == 200) {
        print('success');
        final data = json.decode(response.body);

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
