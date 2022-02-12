import 'package:flutter/material.dart';

import '../config.dart';
import '../storage/storage.dart';

class AuthenticationPage extends StatefulWidget {
  const AuthenticationPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<AuthenticationPage> createState() => _AuthenticationPageState();
}

class _AuthenticationPageState extends State<AuthenticationPage> {
  bool isAuthenticated = false;

  @override
  void initState() {
    Future.microtask(initApplication);
    super.initState();
  }

  Future<void> initApplication() async {
    var config = Config();
    await config.loadConfigs();
    var storage = Storage();
    await storage.active!.initialize();
    await storage.active!.authorize();
    setState(() {
      isAuthenticated = true;
    });
  }

  String displayStateText() {
    return isAuthenticated ? 'Authenticated' : 'Waiting for authentication...';
  }

  TextStyle displayStateTextStyle() {
    return TextStyle(color: isAuthenticated ? Colors.green : Colors.white);
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        child: Container(
            decoration: const BoxDecoration(color: Colors.black),
            child: Center(
              child: Text(displayStateText(), style: displayStateTextStyle()),
            )));
  }
}
