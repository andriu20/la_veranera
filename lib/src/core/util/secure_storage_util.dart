import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageUtil {
  // Singleton
  static final SecureStorageUtil _instance = SecureStorageUtil._internal();

   factory SecureStorageUtil() {
    return _instance;
  }

  SecureStorageUtil._internal();

  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  // Métodos de utilidad
  Future<void> write(String key, String value) async {
    await _storage.write(key: key, value: value);
  }

  Future<String?> read(String key) async {
    return await _storage.read(key: key);
  }

  Future<void> delete(String key) async {
    await _storage.delete(key: key);
  }

  Future<void> deleteAll() async {
    await _storage.deleteAll();
  }
}
