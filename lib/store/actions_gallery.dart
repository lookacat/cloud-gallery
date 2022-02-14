import 'package:flutter/widgets.dart';

import '../models/resource.dart';
import '../storage/storage.dart';
import '../storage/storage_image.dart';

class ActionsGallery {
  static Future<List<Image>> getAllImages() async {
    final List<Image> images = [];
    final List<Resource> resources =
        await Storage().active!.getFiles("/files/admin");
    for (var res in resources) {
      if (!res.name!.contains(".jpg")) continue;
      print(res.path);
      var img =
          await StorageImage.getStorageImage(res.path!, Storage().active!);
      images.add(img);
    }
    return images;
  }
}
