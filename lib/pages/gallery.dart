import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../store/actions_gallery.dart';
import '../store/store_gallery.dart';
import '../utils/log.dart';

class GalleryPage extends StatefulWidget {
  const GalleryPage({Key? key}) : super(key: key);

  @override
  State<GalleryPage> createState() => _GalleryPageState();
}

class _GalleryPageState extends State<GalleryPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(loadImages);
  }

  Future<void> loadImages() async {
    final imgs = await ActionsGallery.getAllImages();
    for (var img in imgs) {
      StoreGallery.store.addItem(img);
    }
    log.i("Refreshed gallery images");
  }

  Widget buildGallery() {
    return Observer(
      builder: (context) => StaggeredGrid.count(
        crossAxisCount: StoreGallery.store.crossAxisCount,
        mainAxisSpacing: 20,
        crossAxisSpacing: 25,
        children: [
          for (var img in StoreGallery.store.images)
            StaggeredGridTile.count(
              crossAxisCellCount: 1,
              mainAxisCellCount: 2,
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 8,
                        spreadRadius: 3,
                        color: Colors.black.withOpacity(0.24),
                      ),
                    ]),
                clipBehavior: Clip.hardEdge,
                child: FittedBox(
                  fit: BoxFit.cover,
                  child: img,
                ),
              ),
            ),
        ],
      ),
    );
  }

  var _v = 1.0;
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        decoration: const BoxDecoration(
          color: Color(0xff1F2123),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Container(
                height: 50,
                child: Row(
                  children: <Widget>[
                    const Text(
                      "Gallery",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    Observer(
                      builder: (context) => Slider(
                        min: 1,
                        max: 4,
                        value: _v,
                        divisions: 3,
                        thumbColor: Colors.white,
                        activeColor: Colors.white,
                        inactiveColor: Colors.white,
                        onChanged: (v) {
                          setState(() {
                            _v = v;
                          });
                          StoreGallery.store.setCrossAxisCount(v.toInt());
                        },
                      ),
                    ),
                  ],
                ),
              ),
              buildGallery(),
            ],
          ),
        ),
      ),
    );
  }
}
