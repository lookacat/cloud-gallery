import 'dart:typed_data';
import 'package:flutter/widgets.dart';
import '../storage/storage_image.dart';
import '../storage/storage_owncloud.dart';

class ImageWidget extends StatefulWidget {
  const ImageWidget({Key? key}) : super(key: key);

  @override
  _ImageWidgetState createState() => _ImageWidgetState();
}

class _ImageWidgetState extends State<ImageWidget> {
  Image? image;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      //_initState();
    });
  }

  Future<void> _initState() async {
    var ocStorage = StorageOwncloud();
    ocStorage.initialize();
    ocStorage.authorize("demo", "demo");
    /*await ocStorage.webdavClient!.writeFromFile(
        "C:/Users/paul/Pictures/charttest.jpg", "/charttest.jpg");
    image = await StorageImage.getStorageImage("/charttest.jpg", ocStorage);*/
    setState(() {
      image = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(onTap: () {}, child: Container(child: image));
  }
}
