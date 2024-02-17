import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fossil_mobile/app/provider/app_start_provider.dart';
import 'package:fossil_mobile/features/auth/widget/login.dart';
import 'package:fossil_mobile/features/home/widget/home.dart';
import 'package:fossil_mobile/shared/widget/connection_unavailable_widget.dart';
import 'package:fossil_mobile/shared/widget/loading_widget.dart';

class AppStartPage extends ConsumerWidget {
  const AppStartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(appStartNotifierProvider);

    return state.when(
        data: (data) {
          return data.maybeWhen(
            initial: () => const LoadingWidget(),
            authenticated: () => HomePage(),
            unauthenticated: () => Login(),
            internetUnAvailable: () => const ConnectionUnavailableWidget(),
            orElse: () => const LoadingWidget(),
          );
        },
        error: (e, st) => const LoadingWidget(),
        loading: () => const LoadingWidget());
  }
}
