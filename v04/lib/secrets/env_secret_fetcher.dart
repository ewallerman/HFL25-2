import 'package:dotenv/dotenv.dart';

class EnvSecretFetcher {

  static String fetchApiKey() {
    final DotEnv env = DotEnv()..load();
    final String apiKey = env.getOrElse('API_KEY', () => '');

    return apiKey;
  }
}