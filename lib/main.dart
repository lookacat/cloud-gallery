import 'package:flutter/material.dart';
import 'package:awesome_cloud_gallery/components/Background.dart';
import 'package:awesome_cloud_gallery/components/iWidget.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:awesome_cloud_gallery/components/image_widget.dart';
import 'package:awesome_cloud_gallery/components/upload_widget.dart';

import 'storage/storage.dart';
import 'storage/storage_resource.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Image myImage = Image.asset("assets/background.jpg");

  @override
  void initState() {
    var storage = Storage();
    storage.active!.initialize().then((_) => storage.active!.authorize());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return buildMaterialApp();
  }

  Material buildMaterialApp() {
    return Material(
        child: Background(
            child: StaggeredGrid.count(
      crossAxisCount: 4,
      mainAxisSpacing: 20,
      crossAxisSpacing: 20,
      children: [
        StaggeredGridTile.count(
            crossAxisCellCount: 2,
            mainAxisCellCount: 2,
            child: ElevatedButton(
              child: Text("Hello Team"),
              onPressed: () async {
                await buttonPressed();
              },
            )),
        const StaggeredGridTile.count(
            crossAxisCellCount: 2, mainAxisCellCount: 1, child: ImageWidget()),
        const StaggeredGridTile.count(
          crossAxisCellCount: 1,
          mainAxisCellCount: 1,
          child: UploadWidget(),
        ),
        const StaggeredGridTile.count(
          crossAxisCellCount: 1,
          mainAxisCellCount: 1,
          child: iWidget(),
        ),
        const StaggeredGridTile.count(
          crossAxisCellCount: 4,
          mainAxisCellCount: 2,
          child: iWidget(),
        ),
      ],
    )));
  }

  Future<void> buttonPressed() async {
    var resources = await Storage().active!.getFiles("/files/admin");
    resources.forEach((Resource file) {
      // ignore: avoid_print
      print(file.name);
    });
  }
}
