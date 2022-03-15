import 'package:webdav_client/webdav_client.dart';

class Resource {
  String? path;
  bool? isDir;
  String? name;
  String? mimeType;
  int? size;
  String? eTag;
  DateTime? cTime;
  DateTime? mTime;

  Resource({
    this.path,
    this.isDir = false,
    this.name,
    this.mimeType,
    this.size,
    this.eTag,
    this.cTime,
    this.mTime,
  });

  Resource.fromWebDavFile(File from) {
    path = from.path;
    isDir = from.isDir;
    name = from.name;
    mimeType = from.mimeType;
    size = from.size;
    eTag = from.eTag;
    cTime = from.cTime;
    mTime = from.mTime;
  }
}
