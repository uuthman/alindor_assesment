import 'dart:convert';

import 'package:alindor_assessment/core/storage.dart';
import 'package:alindor_assessment/domain/model.dart';

const String user = "user_storage_key";

class UserStorage {
  final Storage _storage;

  UserStorage(this._storage);

  Future<void> storeUser(UserData value) async {
    await _storage.writeKey(user, value.toJson());
  }

  Future<UserData?> getUser() async {
    final jsonString = await _storage.getValue(user);

    if (jsonString != null) {
      final map = json.decode(jsonString);
      return UserData(map["name"], map["email"]);
    }
    return null;
  }

  Future<void> clearData() async {
    await _storage.deleteKey(user);
  }
}
