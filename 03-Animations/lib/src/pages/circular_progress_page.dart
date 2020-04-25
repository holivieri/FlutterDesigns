import 'dart:math';

import 'package:flutter/material.dart';

class CircularProgressPage extends StatefulWidget {

  @override
  _CircularProgressPageState createState() => _CircularProgressPageState();

}

class _CircularProgressPageState extends State<CircularProgressPage> {

  double porcentaje = 10;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.pink,
          child: Icon(Icons.plus_one),
          onPressed: () {
            setState(() {
                  porcentaje += 10;
                  if(porcentaje > 100){
                    porcentaje = 0;
                  }  
            });
          },
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(5.0),
          height: 300.0,
          width: 300.0,
          //color: Colors.red,
          child: CustomPaint(
                  painter: _MiRadialProgress(porcentaje),

              ),
        ),
      ),
    );
  }
}

class _MiRadialProgress extends CustomPainter
{
  final porcentaje;

    _MiRadialProgress(this.porcentaje);



  @override
  void paint(Canvas canvas, Size size) {

    

    final paint = new Paint()
        ..strokeWidth = 5
        ..color = Colors.grey
        ..style = PaintingStyle.stroke;

    final center = new Offset(size.width * 0.5, size.height * 0.5);
    final radio = min(size.width * 0.5, size.height * 0.5);

    canvas.drawCircle(center, radio, paint);

    //Arco
     final paintArco = new Paint()
        ..strokeWidth = 10
        ..color = Colors.orange
        ..style = PaintingStyle.stroke;

    //parte que debo llenar
    double arcAngle = 2 * pi * (porcentaje / 100);
    canvas.drawArc(Rect.fromCircle(center: center, radius: radio), 
                  (- pi / 2), 
                  arcAngle, 
                  false, 
                  paintArco);

  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }

}