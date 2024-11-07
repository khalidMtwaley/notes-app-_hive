import 'package:hive/hive.dart';

class HiveHelper {
  static const String _cacheBox = 'cacheBox';
  static const String _bearerTokenKey = 'token';
  static const String _languageCodeKey = 'language_code';

  // Open the Hive box
  static Future<Box> _getCacheBox() async {
    return await Hive.openBox(_cacheBox);
  }

  // Save Bearer Token
  static Future<void> saveBearerToken(String token) async {
    final box = await _getCacheBox();
    await box.put(_bearerTokenKey, token);
  }

  // Get Bearer Token
  static Future<String?> getBearerToken() async {
    final box = await _getCacheBox();
    return box.get(_bearerTokenKey);
  }

  // Delete Bearer Token
  static Future<void> deleteBearerToken() async {
    final box = await _getCacheBox();
    await box.delete(_bearerTokenKey);
  }

  // Save Language Code
  static Future<void> saveLanguageCode(String languageCode) async {
    final box = await _getCacheBox();
    await box.put(_languageCodeKey, languageCode);
  }

  static Future<String?> getLanguageCode() async {
    final box = await _getCacheBox();
    return box.get(_languageCodeKey) ?? 'en'; // Default to 'en'
  }

  // Clear all cached data (optional)
  static Future<void> clearCache() async {
    final box = await _getCacheBox();
    await box.clear();
  }
}
