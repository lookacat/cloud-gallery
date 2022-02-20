import 'package:awesome_cloud_gallery/pages/authentication.dart';
import 'package:flutter/material.dart';

void main() async {
  runApp(const CloudGallery());
}

class CloudGallery extends StatelessWidget {
  const CloudGallery({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cloud Gallery',
      theme: ThemeData(
          fontFamily: "Inter",
          scrollbarTheme: ScrollbarThemeData(
            thumbColor: MaterialStateProperty.all(
              const Color(0xff777777),
            ),
          )),
      home: const AuthenticationPage(),
    );
  }
}
