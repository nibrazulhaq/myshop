import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = 'https://fakestoreapi.com';
  static const String loginEndpoint = '/auth/login';

  Future<String?> login(String username, String password) async {
    final url = Uri.parse('$baseUrl$loginEndpoint');

    try {
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode({
          'username': username,
          'password': password,
        }),
      );

      if (response.statusCode == 200) {
        // Parse the response
        final data = json.decode(response.body);
        return data['token']; // Assuming the response contains a token
      } else {
        // Handle errors
        print('Failed to log in: ${response.body}');
        return null;
      }
    } catch (e) {
      print('Error: $e');
      return null;
    }
  }
}
