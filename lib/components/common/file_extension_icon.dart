import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:path/path.dart' as path;
import 'package:webdav_client/webdav_client.dart';

class FileExtensionIcon extends StatelessWidget {
  final File resource;
  const FileExtensionIcon({
    Key? key,
    required this.resource,
  }) : super(key: key);

  String get extensionType {
    if (resource.isDir!) return 'folder1';
    return path
        .extension(resource.name.toString())
        .toLowerCase()
        .replaceAll(".", "");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 33,
      height: 33,
      margin: const EdgeInsets.only(right: 10),
      decoration: const BoxDecoration(
        color: Colors.transparent,
      ),
      child: Center(
        child: Container(
          width: resource.isDir! ? 33 : 22,
          height: resource.isDir! ? 33 : 22,
          padding: EdgeInsets.only(left: resource.isDir! ? 4 : 0),
          decoration: const BoxDecoration(
            color: Colors.transparent,
          ),
          child: SvgPicture.asset(
            'assets/file_icons/$extensionType.svg',
            fit: BoxFit.scaleDown,
          ),
        ),
      ),
    );
  }
}
