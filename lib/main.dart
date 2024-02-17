import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:fossil_mobile/start.dart';

Future<void> main() async {
  await dotenv.load(fileName: 'assets/env/.env.development');

  await start();
}
