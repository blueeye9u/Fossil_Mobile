// auth_provider.dart
import 'package:fossil_mobile/controller/auth_controller.dart';
import 'package:riverpod/riverpod.dart';
import 'package:fossil_mobile/model/user.dart';

final authControllerProvider =
    StateNotifierProvider<AuthController, AsyncValue<User?>>((ref) {
  return AuthController();
});
final userProvider = Provider<User?>((ref) {
  // You can customize this logic based on your app requirements
  // For example, you might fetch the user from SharedPreferences or another storage.
  return ref.watch(authControllerProvider).maybeWhen(
        data: (user) => user,
        orElse: () => null,
      );
});
