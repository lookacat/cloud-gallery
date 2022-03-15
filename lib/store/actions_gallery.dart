import 'dart:developer';

import '../models/resource.dart';
import '../store/store_gallery.dart';
import 'package:flutter/widgets.dart';
import '../storage/storage.dart';
import '../storage/storage_image.dart';
import 'package:logger/logger.dart';

class ActionsGallery {
  static Future<List<Image>> getAllImages() async {
    final List<Image> images = [];
    final Map<String, Resource> resources =
        await Storage().active!.getFiles("/files/admin");
    for (var key in resources.keys) {
      var res = resources[key];
      if (!res!.name!.contains(".jpg") && !res.name!.contains(".png")) {
        log(res.name!);
        continue;
      }
      Logger().i("Loading image");
      var img = await StorageImage.getStorageImage(
          res.path! + "?x=1500&y=1500&preview=1&a=1", Storage().active!);
      StoreGallery.store.addItem(img);
    }
    return images;
  }
}
