import 'dart:convert';
import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:home_ui/components/Background.dart';
import 'package:home_ui/components/iWidget.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:webdav_client/webdav_client.dart' as webdav;


void main() async {
  runApp(const MyApp());
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

  Image myImage = Image.asset("assets/background.jpg");
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
          children: [
            StaggeredGridTile.count(
              crossAxisCellCount: 2,
              mainAxisCellCount: 2,
              child: ElevatedButton(
                child: Text("Hello Team"),
                onPressed: () async { await buttonPressed(); },
              )
            ),
            StaggeredGridTile.count(
              crossAxisCellCount: 2,
              mainAxisCellCount: 1,
              child: Container(
                child: Text("clickMe"),
                decoration: BoxDecoration(
                  color: Colors.black,
                  image: DecorationImage(
                    image: myImage.image, 
                    fit:BoxFit.cover
                  ),
                )
              )
            ),
            const StaggeredGridTile.count(
              crossAxisCellCount: 1,
              mainAxisCellCount: 1,
              child: iWidget(),
            ),
            const StaggeredGridTile.count(
              crossAxisCellCount: 1,
              mainAxisCellCount: 1,
              child: iWidget(),
            ),
            const StaggeredGridTile.count(
              crossAxisCellCount: 4,
              mainAxisCellCount: 2,
              child: iWidget(),
            ),
          ],
        )
      )
    );
  }


  Future<void> buttonPressed() async {
    var client = webdav.newClient(
      'https://demo.owncloud.com/remote.php/webdav/',
      user: 'demo',
      password: 'demo',
    );
    client.setHeaders({
      'accept-charset': 'utf-8', 
      'authorization': "Bearer 0Ep4VNuKHt3XPhTloigX8MYLjc7347Un882Ig32h1ok7CfzUzFXf0EwKk43GE5uc"}
    );

    // Set the connection server timeout time in milliseconds.
    client.setConnectTimeout(8000);

    // Set send data timeout time in milliseconds.
    client.setSendTimeout(8000);

    // Set transfer data time in milliseconds.
    client.setReceiveTimeout(8000);

    // Test whether the service can connect
    var list = await client.readDir('/');
    list.forEach((f) {
        print('${f.name} ${f.path}');
      });

    var content = await client.read('/46-39805972.jpg', onProgress: (c, t) {
        
    });
    var ucontent = Uint8List.fromList(content);
    var img = Image.memory(ucontent);
    myImage = img;
    print(img);
  }
}
