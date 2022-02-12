import 'package:awesome_cloud_gallery/storage/storage_owncloud.dart';

import 'storage_provider.dart';

class Storage {
  StorageProvider? active;

  static final Storage _instance = Storage._internal();
  factory Storage() => _instance;

  Storage._internal() {
    active = StorageOwncloud();
  }
}
