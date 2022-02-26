import '../pages/experimental.dart';
import 'package:flutter/material.dart';

import '../app.dart';
import '../config.dart';
import '../storage/storage.dart';

class AuthenticationPage extends StatefulWidget {
  const AuthenticationPage({Key? key}) : super(key: key);

  @override
  State<AuthenticationPage> createState() => _AuthenticationPageState();
}

class _AuthenticationPageState extends State<AuthenticationPage> {
  bool isAuthenticated = false;

  @override
  void initState() {
    super.initState();
    Future.microtask(initApplication);
  }

  Future<void> initApplication() async {
    var config = Config();
    var storage = Storage();
    await config.loadConfigs();
    await storage.initializeAndAuthorize(context);
    setState(() {
      isAuthenticated = true;
    });
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const App()),
    );
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
        ),
      ),
    );
  }
}
