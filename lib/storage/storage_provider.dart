import 'package:webdav_client/webdav_client.dart';

abstract class StorageProvider {
  Future<void> initialize();
  Future<void> authorize();
  Future<Map<String, File>> getFiles(String directory);
  Future<String> getFileEtag(String fileName);
  Future<List<int>> getFileContent(String fileName);
  Future<void> uploadFile(String localPath, String remotePath);
}
