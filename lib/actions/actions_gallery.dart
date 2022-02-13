import 'dart:typed_data';

import 'package:flutter/widgets.dart';
import 'package:awesome_cloud_gallery/storage/storage_provider.dart';

class StorageImage {
  static Future<Image> getStorageImage(
      String imagePath, StorageProvider provider) async {
    List<int> imageBytes = await provider.getFileContent(imagePath);
    Uint8List imageUint8List = Uint8List.fromList(imageBytes);
    return Image.memory(imageUint8List);
  }
}
