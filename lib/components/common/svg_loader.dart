import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

class SvgLoader {
  static Widget withFallback(String localPath, String fallbackPath) =>
      FutureBuilder(
        future: _futureAssetWithFallback(localPath, fallbackPath),
        builder: (BuildContext context, snapshot) =>
            snapshot.hasData ? snapshot.data as Widget : Container(),
      );

  static Future<SvgPicture> _futureAssetWithFallback(
          String localPath, String fallbackPath) async =>
      (await isLocalAsset(localPath))
          ? SvgPicture.asset(localPath)
          : SvgPicture.asset(fallbackPath);

  // Test if a file exists without throwing an Exception
  static Future<bool> isLocalAsset(String assetPath) async {
    try {
      await rootBundle.loadString(assetPath);
      return true;
    } catch (_) {
      return false;
    }
  }
}
