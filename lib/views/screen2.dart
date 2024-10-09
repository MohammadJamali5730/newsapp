import 'package:flutter/material.dart';

class Screen2 extends StatelessWidget {
  const Screen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome to page 2'),
      ),
      body: Center(
        child: Column(
          children: [
            ClipPath(
              clipper: CircleClipper(), // استفاده از clipper برای ترسیم دایره
              child: Container(
                width: 200,
                height: 200,
                color: Colors.orange, // رنگ زمینه برای مشاهده بهتر دایره
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// تعریف Clipper برای ترسیم دایره
class CircleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    // ترسیم یک دایره
    path.addOval(Rect.fromCircle(
      center: Offset(size.width / 2, size.height / 2), // مرکز دایره
      radius: size.width / 2, // شعاع دایره
    ));
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false; // چون تغییر دائمی نداریم، false برمی‌گردانیم
  }
}
