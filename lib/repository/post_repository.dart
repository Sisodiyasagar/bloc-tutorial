import 'dart:convert';
import 'dart:io';
import 'package:bloc_tutorial/models/posts_model.dart';
import 'package:http/http.dart' as http;

class PostRepository {
  Future<List<PostsModel>> getData() async {
    try {
      final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/comments'));
      if (response.statusCode == 200) {
        print(response.body);
        var data = jsonDecode(response.body);
        return data.map<PostsModel>((json) => PostsModel(
          id: json["id"] as int,
          name: json["name"] as String,
          body: json["body"] as String,
          email: json["email"] as String,
          postId: json["postId"] as int,
        )).toList();
      } else {
        throw Exception("Error: ${response.statusCode} while fetching data");
      }
    } on SocketException {
      throw Exception("No Internet Connection");
    } catch (e) {
      throw Exception("Unexpected error occurred: $e");
    }
  }
}
