import 'package:flutter/material.dart';

class PrimaryMenu extends StatefulWidget {
  const PrimaryMenu({Key? key}) : super(key: key);

  @override
  State<PrimaryMenu> createState() => _PrimaryMenuState();
}

class _PrimaryMenuState extends State<PrimaryMenu> {
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
        decoration: const BoxDecoration(color: Colors.black),
        child: Center(
          child: Text("test", style: displayStateTextStyle()),
        ));
  }
}
