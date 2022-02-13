import 'dart:typed_data';

import 'package:flutter/widgets.dart';
import 'package:awesome_cloud_gallery/storage/storage_provider.dart';

import '../models/resource.dart';
import '../storage/storage.dart';

class ActionsGallery {
  static Future<List<Image>> getAllImages() async {
    final List<Image> images = [];
    final List<Resource> resources =
        await Storage().active!.getFiles("/files/admin");
    return images;
  }
}
