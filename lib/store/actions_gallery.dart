import '../store/store_gallery.dart';
import 'package:flutter/widgets.dart';

import '../models/resource.dart';
import '../storage/storage.dart';
import '../storage/storage_image.dart';
import 'package:logger/logger.dart';

class ActionsGallery {
  static Future<List<Image>> getAllImages() async {
    final List<Image> images = [];
    final List<Resource> resources =
        await Storage().active!.getFiles("/files/admin");
    for (var res in resources) {
      if (!res.name!.contains(".jpg")) continue;
      Logger().i("Loading image");
      var img = await StorageImage.getStorageImage(
          res.path! + "?x=1500&y=1500&preview=1&a=1", Storage().active!);
      StoreGallery.store.addItem(img);
    }
    return images;
  }
}
