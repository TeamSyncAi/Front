import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:teamsyncai/model/user_model.dart';

class UserApiService {
  static const String baseUrl = "http://127.0.0.1:9090";


  static Future<User> authenticateUser(String username, String password) async {
    final Uri requestUri = Uri.parse('$baseUrl/authenticate');
    final Map<String, String> requestBody = {
      'username': username,
      'password': password,
    };

    final http.Response response = await http.post(
      requestUri,
      headers: {'Content-Type': 'application/json'},
      body: json.encode(requestBody),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);
      return User.fromJson(responseData['user']); // Assuming 'user' is part of the response
    } else {
      throw Exception('Authentication failed');
    }
  }

  static Future<User> fetchUserProfile(String userId) async {
    final Uri requestUri = Uri.parse('$baseUrl/user/profile/$userId');

    final http.Response response = await http.get(
      requestUri,
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);
      return User.fromJson(responseData);
    } else {
      throw Exception('Failed to fetch user profile');
    }
  }

  // Method to send credentials by email (assuming an endpoint exists for this)
  static Future<void> sendCredentialsByEmail(String adminEmail) async {
    final Uri requestUri = Uri.parse('$baseUrl/sendCredentials');
    final Map<String, String> requestBody = {
      'adminEmail': adminEmail,
    };

    final http.Response response = await http.post(
      requestUri,
      headers: {'Content-Type': 'application/json'},
      body: json.encode(requestBody),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to send credentials by email');
    }
  }
  static Future<User> createUser(String username, String email, String password, String role) async {
    final Uri requestUri = Uri.parse('$baseUrl/user/create');
    final Map<String, String> requestBody = {
      'username': username,
      'email': email,
      'password': password,
      'role': role, // Ensure the role is either 'guest' or 'teamleader'
    };

    final http.Response response = await http.post(
      requestUri,
      headers: {'Content-Type': 'application/json'},
      body: json.encode(requestBody),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);
      return User.fromJson(responseData);
    } else {
      throw Exception('Failed to create user');
    }
  }
  // Add other methods as needed...
}