import 'package:awesome_cloud_gallery/storage/storage_owncloud.dart';
import 'package:flutter/material.dart';
import 'package:awesome_cloud_gallery/components/background.dart';
import 'package:awesome_cloud_gallery/components/test_widget.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:awesome_cloud_gallery/components/image_widget.dart';
import 'package:awesome_cloud_gallery/components/upload_widget.dart';

import '../config.dart';
import '../navigator/navigator_store.dart';
import '../storage/storage.dart';
import '../models/resource.dart';

class ExperimentalPage extends StatefulWidget {
  const ExperimentalPage({Key? key}) : super(key: key);

  @override
  State<ExperimentalPage> createState() => _ExperimentalPageState();
}

class _ExperimentalPageState extends State<ExperimentalPage> {
  Image myImage = Image.asset("assets/background.jpg");

  @override
  void initState() {
    Future.microtask(initApplication);
    super.initState();
  }

  Future<void> initApplication() async {
    var config = Config();
    await config.loadConfigs();
    var storage = Storage();
    await storage.active!.initialize();
    await storage.active!.authorize();
  }

  @override
  Widget build(BuildContext context) {
    return buildMaterialApp();
  }

  Material buildMaterialApp() {
    return Material(
      child: Background(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          scrollDirection: Axis.vertical,
          child: StaggeredGrid.count(
            crossAxisCount: 4,
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
            children: [
              StaggeredGridTile.count(
                  crossAxisCellCount: 2,
                  mainAxisCellCount: 2,
                  child: ElevatedButton(
                    child: const Text("Hello Team"),
                    onPressed: () async {
                      await buttonPressed();
                    },
                  )),
              const StaggeredGridTile.count(
                  crossAxisCellCount: 2,
                  mainAxisCellCount: 1,
                  child: ImageWidget()),
              const StaggeredGridTile.count(
                crossAxisCellCount: 1,
                mainAxisCellCount: 1,
                child: UploadWidget(),
              ),
              StaggeredGridTile.count(
                  crossAxisCellCount: 1,
                  mainAxisCellCount: 1,
                  child: ElevatedButton(
                    child: const Text("Gallery"),
                    onPressed: () {
                      NavigatorStore.store.changeRoute("/gallery");
                    },
                  )),
              const StaggeredGridTile.count(
                crossAxisCellCount: 4,
                mainAxisCellCount: 2,
                child: iWidget(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> buttonPressed() async {
    var resources = await Storage().active!.getFiles("/files/admin");
    resources.forEach((Resource file) {
      // ignore: avoid_print
      print(file.name);
    });
    print((StorageOwncloud).toString());
    print(Config().files![(StorageOwncloud).toString()]["baseUrl"]);
    var so = Storage().active! as StorageOwncloud;
    var nt = await so.credential!.getTokenResponse();

    print(nt.expiresIn);
    print(nt.expiresAt);
  }
}
