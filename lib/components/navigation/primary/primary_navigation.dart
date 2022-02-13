import 'package:awesome_cloud_gallery/models/model_primary_navigation_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

import 'primary_navigation_item.dart';

class PrimaryNavigation extends StatefulWidget {
  const PrimaryNavigation({Key? key}) : super(key: key);

  @override
  State<PrimaryNavigation> createState() => _PrimaryNavigationState();
}

class _PrimaryNavigationState extends State<PrimaryNavigation> {
  @override
  void initState() {
    super.initState();
  }

  TextStyle displayStateTextStyle() {
    return const TextStyle(color: Colors.white);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(color: Color(0xff1F2123)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          PrimaryNavigationItem(
            model: ModelPrimaryNavigationItem(
              title: "Home",
              target: "/home",
              icon: SimpleLineIcons.home,
            ),
          ),
          PrimaryNavigationItem(
            model: ModelPrimaryNavigationItem(
              title: "Gallery",
              target: "/gallery",
              icon: SimpleLineIcons.social_instagram,
            ),
          ),
        ],
      ),
    );
  }
}
