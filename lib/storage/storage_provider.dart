import '../models/resource.dart';

abstract class StorageProvider {
  Future<void> initialize();
  Future<void> authorize();
  Future<List<Resource>> getFiles(String directory);
  Future<String> getFileEtag(String fileName);
  Future<List<int>> getFileContent(String fileName);
  Future<void> uploadFile(String localPath, String remotePath);
}
