import 'storage_resource.dart';

abstract class StorageProvider {
  Future<void> initialize();
  Future<void> authorize();
  Future<List<Resource>> getFiles(String directory);
  Future<List<int>> getFileContent(String fileName);
}