// ignore_for_file: library_prefixes
import 'dart:async';
import 'dart:developer';

import 'package:url_launcher/url_launcher.dart';
import 'package:webdav_client/webdav_client.dart' as webdav;
import 'package:openid_client/openid_client_io.dart' as openId;

import 'storage_provider.dart';
import 'storage_resource.dart';

class StorageOwncloud implements StorageProvider {
  webdav.Client? webdavClient;
  openId.Client? openIdClient;
  openId.Authenticator? openIdAuthenticator;
  Map<String, String>? clientHeaders;

  bool initialized = false;

  final String _baseUrl = "https://ocis.ocis-web.latest.owncloud.works";
  final String _openIdClientId = "xdXOt13JKxym1B1QcEncf2XDkLAexMBFwiT9j6EfhhHFJhs2KM9jbjTmf8JBXE69";
  final String _openIdClientSecret = "UBntmLjC2yYCeHwsyj73Uwo9TAaecAetRwMw0xYcvNL9yRdLSUi0hUAHfvCHFeFh";
  final List<String> _openIdScopes = ["profile", "email"];

  openId.Credential? credential;

  @override
  Future<void> initialize() async {
    if (initialized) {
      log('StorageOwncloud already initialized');
      return;
    }
    initialized = true;
    await initializeOpenIdClient();
    await initializeWebdavClient();
  }

  Future<void> initializeOpenIdClient() async {
    var openIdIssuer = await openId.Issuer.discover(Uri.parse(_baseUrl));
    openIdClient = openId.Client(
      openIdIssuer,
      _openIdClientId,
      clientSecret: _openIdClientSecret
    );
    openIdAuthenticator = openId.Authenticator(
      openIdClient!,
      scopes: _openIdScopes,
      port: 4000,
      urlLancher: launchUrl
    );
  }

  Future<void> initializeWebdavClient() async {
    clientHeaders = {"accept-charset": "utf-8"};
    webdavClient = webdav.newClient(
      "$_baseUrl/remote.php/webdav/",
      user: "admin",
      password: "admin",
    );
    webdavClient!.setConnectTimeout(8000);
    webdavClient!.setSendTimeout(8000);
    webdavClient!.setReceiveTimeout(8000);
  }

  @override
  Future<void> authorize() async {
    if (!initialized) {
      log('StorageOwncloud not initialized');
      return;
    }
    if(credential != null) return;
    credential = await openIdAuthenticator!.authorize();
    var accessToken = (await credential!.getTokenResponse()).accessToken;
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
    return await webdavClient!.read(fileName);
  }

  @override
  Future<void> uploadFile(String localPath, String remotePath) async {
    await webdavClient!.writeFromFile(localPath, remotePath);
  }
}
