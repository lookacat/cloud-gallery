import 'package:flutter/material.dart';
import 'package:path/path.dart' as path;
import 'package:webdav_client/webdav_client.dart';

import '../svg_loader.dart';

class FileExtensionIcon extends StatelessWidget {
  final File resource;
  final double size;
  const FileExtensionIcon({
    Key? key,
    required this.resource,
    final this.size = 35.0,
  }) : super(key: key);

  String get extensionType {
    if (resource.isDir!) return 'folder';
    return path
        .extension(resource.name.toString())
        .toLowerCase()
        .replaceAll(".", "");
  }

  String get iconPath {
    return 'assets/file_icons/$extensionType.svg';
  }

  String get iconPathFallback {
    return 'assets/file_icons/file.svg';
  }

  double get iconSize {
    return resource.isDir! ? size : size - (size * 0.35);
  }

  EdgeInsetsGeometry get iconPadding {
    return EdgeInsets.only(
      left: resource.isDir! ? size * 0.12 : 0,
    );
  }

  Widget get icon {
    return SvgLoader.withFallback(
      iconPath,
      iconPathFallback,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      margin: const EdgeInsets.only(
        right: 8,
      ),
      child: Center(
        child: Container(
          width: iconSize,
          height: iconSize,
          padding: iconPadding,
          child: icon,
        ),
      ),
    );
  }
}
