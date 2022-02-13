import 'package:awesome_cloud_gallery/models/primary_navigation_item.dart';
import 'package:flutter/material.dart';

import '../../../navigator/navigator_store.dart';

class PrimaryNavigationItem extends StatefulWidget {
  final ModelPrimaryNavigationItem model;
  const PrimaryNavigationItem({
    Key? key,
    required this.model,
  }) : super(key: key);

  @override
  State<PrimaryNavigationItem> createState() => _PrimaryNavigationItemState();
}

class _PrimaryNavigationItemState extends State<PrimaryNavigationItem> {
  @override
  void initState() {
    super.initState();
  }

  void onItemTap() {
    NavigatorStore.store.changeRoute(widget.model.target);
  }

  Widget buildIcon() {
    return Container(
      width: 50,
      height: 30,
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Icon(
        widget.model.icon,
        color: Colors.white,
        size: 25,
      ),
    );
  }

  Widget buildLabel() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        widget.model.title,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 12,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onItemTap,
      child: Container(
        width: 70,
        height: 70,
        decoration: const BoxDecoration(
          color: Colors.transparent,
        ),
        child: Column(
          children: <Widget>[
            buildIcon(),
            buildLabel(),
          ],
        ),
      ),
    );
  }
}
