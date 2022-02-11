import 'storage_resource.dart';

abstract class StorageProvider {
  void initialize();
  void authorize(String userName, String password);
  Future<List<Resource>> getFiles(String directory);
  Future<List<int>> getFileContent(String fileName);
}