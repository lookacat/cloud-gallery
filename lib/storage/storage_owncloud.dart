// ignore_for_file: library_prefixes
import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:url_launcher/url_launcher.dart';
import 'package:webdav_client/webdav_client.dart' as webdav;
import 'package:openid_client/openid_client_io.dart' as openId;

import '../config.dart';
import 'storage_provider.dart';
import '../models/resource.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

class StorageOwncloud implements StorageProvider {
  webdav.Client? webdavClient;
  openId.Client? openIdClient;
  openId.Credential? credential;
  openId.Authenticator? openIdAuthenticator;
  Map<String, String>? clientHeaders;
  Map<String, dynamic>? config;

  bool initialized = false;

  @override
  Future<void> initialize() async {
    if (initialized) {
      log('StorageOwncloud already initialized');
      return;
    }
    HttpOverrides.global = MyHttpOverrides();
    initialized = true;
    final className = (StorageOwncloud).toString();
    config = Config().files![className];
    await initializeOpenIdClient();
    await initializeWebdavClient();
  }

  Future<void> initializeOpenIdClient() async {
    var openIdIssuer =
        await openId.Issuer.discover(Uri.parse(config!["baseUrl"]));
    openIdClient = openId.Client(
        openIdIssuer, config!["authentication"]["client_id"],
        clientSecret: config!["authentication"]["client_secret"]);
    openIdAuthenticator = openId.Authenticator(openIdClient!,
        scopes: List<String>.from(config!["authentication"]["scopes"]),
        port: 4000,
        urlLancher: launchUrl);
  }

  Future<void> initializeWebdavClient() async {
    clientHeaders = {"accept-charset": "utf-8"};
    final baseUrl = config!["baseUrl"];
    webdavClient = webdav.newClient("$baseUrl/remote.php/dav/",
        debug: false, user: "admin", password: "admin");
    webdavClient!.setConnectTimeout(80000);
    webdavClient!.setSendTimeout(80000);
    webdavClient!.setReceiveTimeout(80000);
  }

  @override
  Future<void> authorize() async {
    if (!initialized) {
      log('StorageOwncloud not initialized');
      return;
    }
    if (credential != null) return;
    credential = await openIdAuthenticator!.authorize();
    var accessToken = (await credential!.getTokenResponse()).accessToken;
    clientHeaders!.addAll({"authorization": "Bearer $accessToken"});
    webdavClient!.setHeaders(clientHeaders!);
  }

  Future<void> refresh() async {
    clientHeaders!.remove("authorization");
    var accessToken = (await credential!.getTokenResponse()).accessToken;
    log("New accessToken: $accessToken");
    clientHeaders!.addAll({"authorization": "Bearer $accessToken"});
    webdavClient!.setHeaders(clientHeaders!);
  }

  Future<void> launchUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url, forceWebView: true);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Future<List<Resource>> getFiles(String directory) async {
    List<Resource> resources = [];
    var fileList = await webdavClient!.readDir(directory);
    for (var file in fileList) {
      resources.add(Resource(name: file.name, path: file.path));
    }
    return resources;
  }

  @override
  Future<List<int>> getFileContent(String fileName) async {
    print("Get file $fileName");
    var c1 = await webdavClient!.read(fileName);
    print("file recieve done");
    var len = c1.length;
    print("len: $len");
    return c1;
  }

  @override
  Future<void> uploadFile(String localPath, String remotePath) async {
    return await webdavClient!.writeFromFile(localPath, remotePath);
  }

  @override
  Future<String> getFileEtag(String fileName) async {
    var response = await webdavClient?.checksum("/files/admin/test.txt");
    return response!.headers["etag"]![0];
  }
}
