import 'package:flutter/material.dart';

void main() {
  runApp(CMyApp());
}

class SeaWaveAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: SeaWaveClipper(),
      child: Container(
        height: 150,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue, Colors.lightBlue],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Text(
            'Sea Wave AppBar',
            style: TextStyle(
              fontSize: 24,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

class SeaWaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final Path path = Path();
    path.moveTo(0, size.height * 0.7);
    path.quadraticBezierTo(
      size.width * 0.25,
      size.height * 0.8,
      size.width * 0.5,
      size.height * 0.7,
    );
    path.quadraticBezierTo(
      size.width * 0.75,
      size.height * 0.6,
      size.width,
      size.height * 0.7,
    );
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

class CMyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(150),
          child: SeaWaveAppBar(),
        ),
        body: Center(
          child: Text(
            'Sea Wave AppBar Content Goes Here',
            style: TextStyle(fontSize: 24),
          ),
        ),
      ),
    );
  }
}