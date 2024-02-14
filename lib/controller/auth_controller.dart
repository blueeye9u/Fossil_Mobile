// auth_controller.dart
import 'package:fossil_mobile/model/user.dart';
import 'package:fossil_mobile/service/api_service.dart';
import 'package:riverpod/riverpod.dart';

class AuthResult {
  final User? user;
  final String? errorMessage;

  AuthResult.success(this.user) : errorMessage = null;
  AuthResult.failure(this.errorMessage) : user = null;
}

class AuthController extends StateNotifier<AsyncValue<User?>> {
  final ApiService api = ApiService();
  AuthController() : super(const AsyncLoading());

  Future<AuthResult> register(
      String username, String email, String password) async {
    try {
      final response = await api.post(
        'auth/signup',
        {
          'email': email,
          'username': username,
          'password': password,
        },
      );
      if (response['success'] == true) {
        final user = User.fromJson(response['data']);
        state = AsyncData(user);
        return AuthResult.success(user);
      } else {
        final errorMessage = response['error'] ?? 'Unknown error';
        state = AsyncError(errorMessage, StackTrace.current);
        return AuthResult.failure(errorMessage);
      }
    } catch (error, stackTrace) {
      state = AsyncError(error, stackTrace);
      return AuthResult.failure('Error: $error');
    }
  }

  // Assuming User is your data model
  Future<AuthResult> login(String email, String password) async {
    try {
      final response = await api.post(
        'auth/signin',
        {
          'email': email,
          'password': password,
        },
      );
      if (response['success'] == true) {
        final user = User.fromJson(response['data']);
        state = AsyncData(user);
        return AuthResult.success(user);
      } else {
        final errorMessage = response['error'] ?? 'Unknown error';
        state = AsyncError(errorMessage, StackTrace.current);
        return AuthResult.failure(errorMessage);
      }
    } catch (error, stackTrace) {
      state = AsyncError(error, stackTrace);
      return AuthResult.failure('Error: $error');
    }
  }
}
