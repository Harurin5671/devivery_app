import 'package:delivery/domain/domain.dart';

import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceService implements LocalStorageService {
  Future<SharedPreferences> get _prefs async => SharedPreferences.getInstance();

  @override
  Future<void> clear() async {
    final prefs = await _prefs;
    await prefs.clear();
  }

  @override
  Future<bool?> readBool(String key) async {
    final prefs = await _prefs;
    return prefs.getBool(key);
  }

  @override
  Future<int?> readInt(String key) async {
    final prefs = await _prefs;
    return prefs.getInt(key);
  }
  
  @override
  Future<String?> readString(String key) async {
    final prefs = await _prefs;
    return prefs.getString(key);
  }
  
  @override
  Future<void> remove(String key) async {
    final prefs = await _prefs;
    await prefs.remove(key);
  }

  @override
  Future<void> writeBool(String key, bool value) async {
    final prefs = await _prefs;
    await prefs.setBool(key, value);
  }

  @override
  Future<void> writeInt(String key, int value) async {
    final prefs = await _prefs;
    await prefs.setInt(key, value);
  }

  @override
  Future<void> writeString(String key, String value) async {
    final prefs = await _prefs;
    await prefs.setString(key, value);
  }
}
