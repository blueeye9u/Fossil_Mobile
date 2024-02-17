import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fossil_mobile/shared/util/logger.dart';
import 'package:fossil_mobile/shared/util/platform_type.dart';
import 'package:overlay_support/overlay_support.dart';

import 'app/app.dart';

Future<void> start() async {
  WidgetsFlutterBinding.ensureInitialized();

  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  final platformType = detectPlatformType();

  runApp(
    ProviderScope(overrides: [
      platformTypeProvider.overrideWithValue(platformType),
    ], observers: [
      Logger()
    ], child: const OverlaySupport.global(child: App())),
  );
}
