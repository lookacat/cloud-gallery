import 'package:cloud_gallery/models/resource.dart';
import 'storage_provider.dart';

class StorageDummy implements StorageProvider {
  @override
  Future<void> authorize() async {}

  @override
  Future<List<int>> getFileContent(String fileName) async {
    return <int>[];
  }

  @override
  Future<String> getFileEtag(String fileName) async {
    return "";
  }

  @override
  Future<List<Resource>> getFiles(String directory) async {
    return <Resource>[];
  }

  @override
  Future<void> initialize() async {}

  @override
  Future<void> uploadFile(String localPath, String remotePath) async {}
}
