import 'package:flutter/material.dart';

class GalleryPage extends StatefulWidget {
  const GalleryPage({Key? key}) : super(key: key);

  @override
  State<GalleryPage> createState() => _GalleryPageState();
}

class _GalleryPageState extends State<GalleryPage> {
  @override
  void initState() {
    super.initState();
  }

  TextStyle displayStateTextStyle() {
    return const TextStyle(color: Colors.white);
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        child: Container(
            decoration: const BoxDecoration(color: Colors.black),
            child: Center(
              child: Text("test", style: displayStateTextStyle()),
            )));
  }
}
