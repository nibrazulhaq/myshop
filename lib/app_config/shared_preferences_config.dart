import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  static SharedPreferencesService? _instance;
  static const String _tokenKey = 'authToken';

  static SharedPreferencesService? get instance => _instance;

  // Key to store the token

  // Save token to shared preferences
  static Future<void> saveToken(String token) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(_tokenKey, token);  // Save the token as a string
    } catch (e) {
      print('Error saving token: $e'); // Handle error while saving token
    }
  }

  // Get token from shared preferences
  Future<String?> getToken() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      return prefs.getString(_tokenKey);  // Retrieve the token
    } catch (e) {
      print('Error retrieving token: $e'); // Handle error while retrieving token
      return null;
    }
  }

  // Remove token (used for logout)
  Future<void> removeToken() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove(_tokenKey);  // Remove the token
    } catch (e) {
      print('Error removing token: $e'); // Handle error while removing token
    }
  }
}
