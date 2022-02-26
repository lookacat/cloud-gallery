import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class iWidget extends StatelessWidget {
  const iWidget({
    Key? key,
  }) : super(key: key);

  BoxDecoration gradient1() {
    return BoxDecoration(
        borderRadius: BorderRadius.circular(27),
        gradient: const LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Colors.blue,
            Colors.red,
          ],
        ));
  }

  BoxDecoration gradient2() {
    return BoxDecoration(
        borderRadius: BorderRadius.circular(27),
        gradient: const LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Color(0xfff1ae39),
            Color(0xfff1cb42),
          ],
        ));
  }

  BoxDecoration color1() {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(27),
      color: const Color.fromRGBO(20, 20, 20, 1),
    );
  }

  BoxDecoration color2() {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(27),
      color: const Color.fromRGBO(0, 0, 0, 0.25),
    );
  }

  BoxDecoration random() {
    var list = [gradient1(), gradient2(), color1(), color2()];
    final _random = Random();
    return list[_random.nextInt(list.length)];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(27),
        decoration: color1(),
        child: Html(data: """
          <a class="h1 text">Montag</a>
          <p><a class="h2 text">24</a></p>
          <br>
          <br>
          <br>
          <a class="h3 text">Heute keine Ereignisse mehr</a>
        """, style: {
          ".text": Style(
              fontFamily: 'Inter',
              fontWeight: FontWeight.w200,
              padding: EdgeInsets.all(0),
              textDecoration: TextDecoration.none,
              textTransform: TextTransform.uppercase),
          ".h1": Style(
            color: Color(0xffe9564f),
            fontWeight: FontWeight.bold,
            fontSize: FontSize(32),
          ),
          ".h2": Style(color: Colors.white, fontSize: FontSize(90)),
          ".h3": Style(color: Color(0xff99989d), fontSize: FontSize(40))
        }));
  }
}
