import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppKeys {
  static String get geminiApiKey => dotenv.env['GEMINI_API_KEY'] ?? '';
}