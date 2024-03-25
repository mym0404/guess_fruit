import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_gemini/flutter_gemini.dart';

final _safetySettings = [
  SafetySetting(
    category: SafetyCategory.dangerous,
    threshold: SafetyThreshold.blockNone,
  ),
  SafetySetting(
    category: SafetyCategory.harassment,
    threshold: SafetyThreshold.blockNone,
  ),
  SafetySetting(
    category: SafetyCategory.hateSpeech,
    threshold: SafetyThreshold.blockNone,
  ),
  SafetySetting(
    category: SafetyCategory.sexuallyExplicit,
    threshold: SafetyThreshold.blockNone,
  ),
];

void initGemini() {
  Gemini.init(
    apiKey: (dotenv.env['GEMINI_KEY'] ?? ''),
    enableDebugging: false,
    safetySettings: _safetySettings,
  );
}

void resetGemini() {
  Gemini.reInitialize(
    apiKey: (dotenv.env['GEMINI_KEY'] ?? ''),
    enableDebugging: false,
    safetySettings: _safetySettings,
  );
}
