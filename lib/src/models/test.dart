import 'package:flutter/material.dart';

class Test extends StatefulWidget {
  const Test({Key? key}) : super(key: key);

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: ClipPath(
          clipper: Shape1(),
          child: Image.network(
            height: 145,
            width: 233,
            "https://tv.chorxos.uz/media/million_2021.jpg",
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

class Shape1 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double height = size.height;
    double width = size.width;

    var path = Path();
    path.lineTo(0, 10);
    path.quadraticBezierTo(1, 1, 10, 0);
    path.lineTo(width - 20, 0);
    path.lineTo(width, 20);
    path.lineTo(width, height - 10);
    path.quadraticBezierTo(width - 1, height - 1, width - 10, height);
    path.lineTo(20, height);
    path.lineTo(0, height - 20);
    path.lineTo(0, height);
    path.close();
    return path;

  }

  @override
  bool shouldReclip(Shape1 oldClipper) => false;
}


class Shape2 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double height = size.height;
    double width = size.width;
    double x = 30;
    double y = 10;

    var path = Path();
    path.lineTo(0, 10);
    path.quadraticBezierTo(1, 1, 10, 0);
    path.lineTo(width - 10, 0);
    path.quadraticBezierTo(width - 1, 1, width, 10);
    path.lineTo(width, x);
    path.lineTo(width - y, x + y);
    path.lineTo(width - y, height - (x + y));
    path.lineTo(width, height - x);
    path.lineTo(width, height - 10);
    path.quadraticBezierTo(width - 1, height - 1, width - 10, height);
    path.lineTo(10, height);
    path.quadraticBezierTo(1, height - 1, 0, height - 10);
    path.lineTo(0, height - x);
    path.lineTo(y, height - (x + y));
    path.lineTo(y, x + y);
    path.lineTo(0, x);
    path.close();
    return path;

  }

  @override
  bool shouldReclip(Shape2 oldClipper) => false;
}

class Shape3 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double height = size.height;
    double width = size.width;
    double x = 10;

    var path = Path();
    path.lineTo(0, x);
    path.lineTo(x, 0);
    path.lineTo(width / 3, 0);
    path.lineTo((width / 3 + x), x);
    path.lineTo(width * 2 / 3 - x, x);
    path.lineTo(width * 2 / 3, 0);
    path.lineTo(width - x, 0);
    path.quadraticBezierTo(width - 1, 1, width, x);
    path.lineTo(width, height - x);
    path.lineTo(width - x, height);
    path.lineTo(width * 2 / 3, height);
    path.lineTo((width * 2 /3 - x), height - x);
    path.lineTo(width * 2 / 3 + x, height - x);
    path.lineTo(width / 3 + x, height - x);
    path.lineTo(width / 3, height);
    path.lineTo(x, height);
    path.quadraticBezierTo(1, height - 1, 0, height - x);
    path.close();
    return path;

  }

  @override
  bool shouldReclip(Shape3 oldClipper) => false;
}
