import 'package:awesome_cloud_gallery/pages/experimental.dart';
import 'package:flutter/material.dart';

void main() async {
  runApp(const CloudGallery());
}

class CloudGallery extends StatelessWidget {
  const CloudGallery({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ExperimentalPage(title: 'Flutter Demo Home Page'),
    );
  }
}
