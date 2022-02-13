import 'package:awesome_cloud_gallery/models/model_primary_navigation_item.dart';
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

  Widget buildIcon(BuildContext context) {
    return SizedBox(
      width: 50,
      height: 50,
      child: Icon(
        widget.model.icon,
        color: Colors.white,
        size: 25,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onItemTap,
      child: SizedBox(
        width: 50,
        height: 50,
        child: Column(
          children: <Widget>[
            buildIcon(context),
          ],
        ),
      ),
    );
  }
}
