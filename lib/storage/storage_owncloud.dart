
// ignore: implementation_imports
import 'package:webdav_client/src/client.dart';
import 'package:webdav_client/webdav_client.dart' as webdav;
import 'storage_provider.dart';
import 'storage_resource.dart';
import 'dart:developer';
import 'dart:convert';


class StorageOwncloud implements StorageProvider {
  Client? webdavClient;
  Map<String, String>? clientHeaders;

  bool initialized = false;
  bool authorized = false;

  @override
  void initialize() {
    if(initialized) {
      log('StorageOwncloud already initialized');
      return;
    }
    initialized = true;
    clientHeaders = {
      "accept-charset": "utf-8"
    };
    webdavClient = webdav.newClient(
      "https://demo.owncloud.com/remote.php/webdav/"
    );
    webdavClient!.setConnectTimeout(8000);
    webdavClient!.setSendTimeout(8000);
    webdavClient!.setReceiveTimeout(8000);
  }

  @override
  void authorize(String userName, String password) {
    if(!initialized) {
      log('StorageOwncloud not initialized');
      return;
    }
    authorized = true;

    String credentials = "$userName:$password";
    var stringToBase64 = utf8.fuse(base64);
    String encoded = stringToBase64.encode(credentials);
    if(clientHeaders!.containsKey("authorization"))  {
      clientHeaders!.remove("authorization");
    }
    clientHeaders!.addAll({
      "authorization": "Basic $encoded"
    });
    webdavClient!.setHeaders(clientHeaders!);
  }

  @override
  Future<List<Resource>> getFiles(String directory) async {
    List<Resource> resources = [];
    var fileList = await webdavClient!.readDir(directory);
    for (var file in fileList) {
      resources.add(Resource(
        name: file.name,
        path: file.path
      ));
    }
    return resources;
  }

  @override
  Future<List<int>> getFileContent(String fileName) {
    return webdavClient!.read(fileName);
  }
}