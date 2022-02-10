abstract class StorageProvider {
  void initialize();
  void authorize(String userName, String password);
  Future<void> getFiles(String directory);
}