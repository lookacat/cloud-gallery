import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../store/actions_gallery.dart';
import '../storage/storage_image.dart';
import '../store/store_gallery.dart';

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

  Future<void> loadImages() async {
    final imgs = await ActionsGallery.getAllImages();
    for (var img in imgs) {
      StoreGallery.store.addItem(img);
    }
    print("added img");
  }

  Widget buildGallery() {
    Future.microtask(loadImages);
    return Observer(
      builder: (context) => StaggeredGrid.count(
        crossAxisCount: 4,
        mainAxisSpacing: 20,
        crossAxisSpacing: 25,
        children: [
          for (var img in StoreGallery.store.images)
            StaggeredGridTile.count(
              crossAxisCellCount: 2,
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

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        decoration: const BoxDecoration(
          color: Color(0xff191B1C),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          scrollDirection: Axis.vertical,
          child: buildGallery(),
        ),
      ),
    );
  }
}
