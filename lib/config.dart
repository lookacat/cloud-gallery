import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:path/path.dart';

class Config {
  Map<String, dynamic>? files;

  static final Config _instance = Config._internal();
  factory Config() => _instance;

  Config._internal() {
    files = <String, dynamic>{};
  }

  Future<void> loadConfigs() async {
    final dir = Directory("./config");

    final manifestContent = await rootBundle.loadString('AssetManifest.json');
    final Map<String, dynamic> manifestMap = json.decode(manifestContent);
    final configFiles = manifestMap.keys
        .where((String key) => key.contains('config/'))
        .where((String key) => key.contains('.json'))
        .toList();

    for (var path in configFiles) {
      final jsonString = await rootBundle.loadString(path);
      final decodedJson = jsonDecode(jsonString);
      final className = basename(path).replaceAll(".json", "");
      files!.addAll({
        className: decodedJson,
      });
      log("Loaded $className config");
    }
  }
}
