import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../models/primary_navigation_item.dart';
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
    HapticFeedback.heavyImpact();
    NavigatorStore.store.changeRoute(widget.model.target);
  }

  Widget buildIcon() {
    return Container(
      width: 50,
      height: 30,
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Icon(
        widget.model.icon,
        color: widget.model.target == NavigatorStore.store.route
            ? Color.fromARGB(255, 185, 213, 248)
            : Color(0xff696969),
        size: 25,
      ),
    );
  }

  Widget buildLabel() {
    return Text(
      widget.model.title,
      style: TextStyle(
        color: widget.model.target == NavigatorStore.store.route
            ? Colors.white
            : Color(0xff696969),
        fontSize: 12,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onItemTap,
      child: Container(
        width: 90,
        decoration: const BoxDecoration(
          color: Colors.transparent,
        ),
        child: Observer(
          builder: (context) => Column(
            children: <Widget>[
              buildIcon(),
              Container(
                margin: const EdgeInsets.symmetric(
                  vertical: 10,
                ),
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 1),
                decoration: widget.model.target == NavigatorStore.store.route
                    ? const BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        gradient: LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          colors: [
                            Color(0xFF0869de),
                            Color(0xFF4e85c8),
                          ],
                        ),
                      )
                    : BoxDecoration(),
                child: buildLabel(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
