import 'package:awesome_cloud_gallery/navigator/navigator.dart';
import 'package:flutter/material.dart';

import 'components/navigation/primary/primary_navigation.dart';

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
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Positioned(
              child: PageNavigator(
                initialRoute: "/gallery",
              ),
              bottom: 70,
              left: 0,
              right: 0,
              top: 0,
            ),
            const Positioned(
              bottom: 0,
              left: 0,
              child: PrimaryNavigation(),
            ),
          ],
        ),
      ),
    );
  }
}
