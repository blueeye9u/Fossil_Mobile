// ignore_for_file: prefer_const_constructors

import 'package:fossil_mobile/features/auth/provider/auth_provider.dart';
import 'package:fossil_mobile/features/auth/repository/token_repository.dart';
import 'package:fossil_mobile/features/auth/state/auth_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../state/app_start_state.dart';

part 'app_start_provider.g.dart';

@riverpod
class AppStartNotifier extends _$AppStartNotifier {
  late final TokenRepository _tokenRepository =
      ref.read(tokenRepositoryProvider);

  @override
  Future<AppStartState> build() async {
    ref.onDispose(() {});

    final authState = ref.watch(authNotifierProvider);

    if (authState is AuthStateLoggedIn) {
      return AppStartState.authenticated();
    }

    if (authState is AuthStateLoggedOut) {
      return AppStartState.unauthenticated();
    }

    final token = await _tokenRepository.fetchToken();
    if (token != null) {
      return const AppStartState.authenticated();
    } else {
      return const AppStartState.unauthenticated();
    }
  }
}
