import 'package:flutter/material.dart';
import 'package:home_ui/components/Background.dart';
import 'package:home_ui/components/iWidget.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:home_ui/components/image_widget.dart';
import 'package:home_ui/storage/storage_owncloud.dart';
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
                onPressed: () async { await buttonPressed(); },
              )
            ),
            const StaggeredGridTile.count(
              crossAxisCellCount: 2,
              mainAxisCellCount: 1,
              child: ImageWidget()
            ),
            const StaggeredGridTile.count(
              crossAxisCellCount: 1,
              mainAxisCellCount: 1,
              child: iWidget(),
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
        )
      )
    );
  }

  Future<void> buttonPressed() async {
    var ocStorage = StorageOwncloud();
    ocStorage.initialize();
    ocStorage.authorize("demo", "demo");

    var resources = await ocStorage.getFiles("/");
    resources.forEach((Resource file) {
      // ignore: avoid_print
      print(file.name);
    });
    await ocStorage.webdavClient!.writeFromFile(
      "C:/Users/paul/Pictures/charttest.jpg",
      "/charttest.jpg"
    );
    /*
    var content = await client.read('/46-39805972.jpg', onProgress: (c, t) {
    });
    var ucontent = Uint8List.fromList(content);
    var img = Image.memory(ucontent);
    myImage = img;
    print(img);*/
  }
}
