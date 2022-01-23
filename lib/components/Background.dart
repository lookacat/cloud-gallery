import 'dart:ui';

import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  final Widget child;

  const Background({
    Key? key,
    required this.child
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 200,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/background.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 69, sigmaY: 69),
        child: Container(
          color: Colors.black.withOpacity(0.59),
          child: Container(
            padding: const EdgeInsets.all(20),
            child: child
          )
        ),
      ),
    );
  }
}