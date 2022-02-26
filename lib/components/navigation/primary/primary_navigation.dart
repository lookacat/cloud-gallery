// ignore_for_file: import_of_legacy_library_into_null_safe

import '../../../models/primary_navigation_item.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

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

  BoxDecoration buildContainerDecoration() {
    return BoxDecoration(
      color: const Color(0xff1F2123),
      border: const Border(
        top: BorderSide(
          width: 1,
          color: Color.fromARGB(255, 84, 89, 95),
        ),
      ),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.3),
          spreadRadius: 3,
          blurRadius: 18,
          offset: const Offset(0, 3), // changes position of shadow
        ),
      ],
    );
  }

  Widget buildItemRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        PrimaryNavigationItem(
          model: ModelPrimaryNavigationItem(
            title: "Home",
            target: "/home",
            icon: Ionicons.home,
          ),
        ),
        PrimaryNavigationItem(
          model: ModelPrimaryNavigationItem(
            title: "Gallery",
            target: "/gallery",
            icon: Ionicons.images_outline,
          ),
        ),
        PrimaryNavigationItem(
          model: ModelPrimaryNavigationItem(
            title: "File",
            target: "/file",
            icon: Ionicons.folder_outline,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: MediaQuery.of(context).size.width,
      decoration: buildContainerDecoration(),
      child: buildItemRow(),
    );
  }
}
