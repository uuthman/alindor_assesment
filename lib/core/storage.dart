import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Storage {
  final FlutterSecureStorage _secureStorage;

  Storage(this._secureStorage);

  Future<String?> getValue(String key) async {
    String? value = await _secureStorage.read(key: key);
    return value;
  }

  Future<Map<String, String>> getValues() async {
    var result = await _secureStorage.readAll();
    return result;
  }

  Future<void> deleteKey(dynamic key) async => await _secureStorage.delete(key: key);

  Future<void> emptyDB() async => await _secureStorage.deleteAll();

  Future<void> writeKey(String key, String value) async {
    await _secureStorage.write(key: key, value: value);
  }
}
