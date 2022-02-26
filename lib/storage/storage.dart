import 'package:flutter/material.dart';

import '../config.dart';
import '../storage/storage_owncloud.dart';

import 'storage_dummy.dart';
import 'storage_provider.dart';

class Storage {
  StorageProvider? active;
  Map<String, dynamic>? config;

  static final Storage _instance = Storage._internal();
  factory Storage() => _instance;

  Storage._internal() {
    active = StorageOwncloud();
  }

  Future<void> initializeAndAuthorize(BuildContext context) async {
    final className = (Storage).toString();
    config = Config().files![className];
    final storageType = config!["storage"] as String;
    switch (storageType.toLowerCase()) {
      case "owncloud":
        active = StorageOwncloud();
        break;
      default:
        active = StorageDummy();
        break;
    }
    await active!.initialize();
    await active!.authorize();
  }
}
