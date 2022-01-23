import 'dart:ui';

import 'package:desktop_window/desktop_window.dart';
import 'package:flutter/material.dart';
import 'package:home_ui/components/Background.dart';
import 'package:home_ui/components/SquareWidget.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';


void main() async {
  runApp(const MyApp());
  await DesktopWindow.toggleFullScreen();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return buildMaterialApp();
  }

  Material buildMaterialApp() {
    return Material( 
      child: Background(
        child: StaggeredGrid.count(
          crossAxisCount: 4,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
          children: const [
            StaggeredGridTile.count(
              crossAxisCellCount: 2,
              mainAxisCellCount: 2,
              child: SquareWidget(),
            ),
            StaggeredGridTile.count(
              crossAxisCellCount: 2,
              mainAxisCellCount: 1,
              child: SquareWidget(),
            ),
            StaggeredGridTile.count(
              crossAxisCellCount: 1,
              mainAxisCellCount: 1,
              child: SquareWidget(),
            ),
            StaggeredGridTile.count(
              crossAxisCellCount: 1,
              mainAxisCellCount: 1,
              child: SquareWidget(),
            ),
            StaggeredGridTile.count(
              crossAxisCellCount: 4,
              mainAxisCellCount: 2,
              child: SquareWidget(),
            ),
          ],
        )
      )
    );
  }
}
