import 'package:awesome_cloud_gallery/navigator/navigator.dart';
import 'package:flutter/material.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppPageState();
}

class _AppPageState extends State<App> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageNavigator(
      initialRoute: "/home",
    ));
  }
}
