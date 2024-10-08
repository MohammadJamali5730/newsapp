import 'package:flutter/material.dart';

class Screen2 extends StatelessWidget {
  const Screen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(title:const Text('Welcome to page 2 '),),

    body: Center(child: Column(children: [ClipPath()],),),
     
    );
  }
}
class clippath extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    Path path = Path();
    
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {
    return true;
  }
 
}