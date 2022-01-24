import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:responsive_grid/responsive_grid.dart';

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
      )
    );
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
      )
    );
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
  Text test() {
    return const Text(
      'Wendelstein',
      style: TextStyle(
        fontFamily: 'SanFrancisco',
        fontSize: 30,
        color: Colors.white,
        
        backgroundColor: Color.fromARGB(0, 56, 45, 45),
      )
    );
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(27),
      decoration: random(),
      child: ResponsiveGridRow(
        children: [
          ResponsiveGridCol(
            lg: 12,
            child: Container(
              height: 50,
              alignment: const Alignment(0, 0),
              color: Colors.purple,
              child: const Text("lg : 12"),
            ),
          ),
          ResponsiveGridCol(
            xs: 6,
            md: 3,
            child: Container(
              height: 50,
              alignment: const Alignment(0, 0),
              color: Colors.green,
              child: const Text("xs : 6 \r\nmd : 3"),
            ),
          ),
          ResponsiveGridCol(
            xs: 6,
            md: 3,
            child: Container(
              height: 50,
              alignment: const Alignment(0, 0),
              color: Colors.orange,
              child: const Text("xs : 6 \r\nmd : 3"),
            ),
          ),
          ResponsiveGridCol(
            xs: 6,
            md: 3,
            child: Container(
              height: 50,
              alignment: const Alignment(0, 0),
              color: Colors.red,
              child: const Text("xs : 6 \r\nmd : 3"),
            ),
          ),
          ResponsiveGridCol(
            xs: 6,
            md: 3,
            child: Container(
              height: 50,
              alignment: const Alignment(0, 0),
              color: Colors.blue,
              child: const Text("xs : 6 \r\nmd : 3"),
            ),
          ),
        ]
      )
    );
  }
}