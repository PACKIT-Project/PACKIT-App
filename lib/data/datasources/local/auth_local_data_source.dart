import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:packit/domain/entities/packit_login_entity.dart';

class AuthLocalDataSource {
  final FlutterSecureStorage storage = const FlutterSecureStorage();

  Future<void> deleteCredential() async {
    await storage.delete(key: 'credential');
  }

  Future<PackitLoginEntity?> getCredential() async {
    final credential = await storage.read(key: 'credential');

    if (credential != null) {
      return PackitLoginEntity.fromJson(jsonDecode(credential));
    } else {
      return null;
    }
  }

  Future<void> saveCredential(PackitLoginEntity credential) async {
    await storage.write(key: 'credential', value: jsonEncode(credential.toJson()));
  }
}
