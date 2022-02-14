import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../store/actions_gallery.dart';
import '../storage/storage_image.dart';

class GalleryPage extends StatefulWidget {
  const GalleryPage({Key? key}) : super(key: key);

  @override
  State<GalleryPage> createState() => _GalleryPageState();
}

class _GalleryPageState extends State<GalleryPage> {
  List<Image>? imageList;

  @override
  void initState() {
    imageList = [];
    super.initState();
  }

  Future<void> loadImages() async {
    final imgs = await ActionsGallery.getAllImages();
    setState(() {
      imageList!.addAll(imgs);
    });
  }

  List<Widget> buildImageTiles() {
    List<Widget> list = <Widget>[];
    for (var image in imageList!) {
      list.add(
        StaggeredGridTile.count(
          crossAxisCellCount: 2,
          mainAxisCellCount: 2,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            clipBehavior: Clip.hardEdge,
            child: FittedBox(
              fit: BoxFit.cover,
              child: image,
            ),
          ),
        ),
      );
    }
    return list;
  }

  Widget buildGallery() {
    Future.microtask(ActionsGallery.getAllImages);
    return StaggeredGrid.count(
        crossAxisCount: 4,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
        children: buildImageTiles());
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
