import 'package:flutter/material.dart';
import '../components/common/background.dart';
import '../components/common/test_widget.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../components/common/image_widget.dart';
import '../components/common/upload_widget.dart';
import '../navigator/navigator_store.dart';
import '../storage/storage.dart';

class ExperimentalPage extends StatefulWidget {
  const ExperimentalPage({Key? key}) : super(key: key);

  @override
  State<ExperimentalPage> createState() => _ExperimentalPageState();
}

class _ExperimentalPageState extends State<ExperimentalPage> {
  Image myImage = Image.asset("assets/background.jpg");

  @override
  void initState() {
    super.initState();
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
    var etag = await Storage().active!.getFileEtag("/files/admin/test.txt");
    print(etag);
  }
}
