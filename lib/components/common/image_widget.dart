import 'package:flutter/widgets.dart';

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
      _initState();
    });
  }

  Future<void> _initState() async {
    setState(() {
      image = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(onTap: () {}, child: Container(child: image));
  }
}
