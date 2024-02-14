import 'package:fossil_mobile/model/user.dart';
import 'package:fossil_mobile/service/api_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

@riverpod
Future<User> register(
    ref, String username, String email, String password) async {
  try {
    final apiService = ApiService(); // Create an instance of ApiService
    final response = await apiService.post(
      'auth/signup',
      {'username': username, 'email': email, 'password': password},
    );
    final user = User.fromJson(response['data']);
    return user;
  } catch (error) {
    throw error; // You can handle errors at a higher level if needed
  }
}

@riverpod
Future<User> login(ref, String username, String password) async {
  try {
    final apiService = ApiService(); // Create an instance of ApiService
    final response = await apiService.post(
      'auth/signin',
      {'email': username, 'password': password},
    );
    final user = User.fromJson(response['data']);
    return user;
  } catch (error) {
    throw error; // You can handle errors at a higher level if needed
  }
}
