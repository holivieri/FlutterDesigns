import 'package:flutter/material.dart'; 

class HeaderCuadrado extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300.0,
      color: Color(0xff615AAB),
      
    );
  }
}

class HeaderBordesRedondeados extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300.0,
      decoration: BoxDecoration(
              borderRadius: BorderRadius.only(bottomRight: Radius.circular(50.0),
              bottomLeft: Radius.circular(50.0)
              ),
               color: Color(0xff615AAB),
               ),
    );
  }
}

class HeaderDiagonal extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
              height: double.infinity,
              width: double.infinity,
             // color: Color(0xff615AAB),
              child: CustomPaint(
                                painter: _HeaderDiagonalPainter(),
                        ),
            );
  }
}

class _HeaderDiagonalPainter extends CustomPainter{
  
  @override
  void paint(Canvas canvas, Size size) {
    
    final lapiz = new Paint();
    lapiz.color = Color(0xff615AAB);
    lapiz.style = PaintingStyle.fill; //bordes
    lapiz.strokeWidth = 5.0;

    //Dibujar con el lapiz y el path
    final path = new Path();
    path.moveTo(0, 0);
    path.lineTo(0, size.height * 0.5);
    path.lineTo(size.width, size.height * 0.40);
    path.lineTo(size.width, 0);

    canvas.drawPath(path, lapiz);

    
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
      
      return true;
  }
}

class HeaderTriangularDiagonal extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
              height: double.infinity,
              width: double.infinity,
             // color: Color(0xff615AAB),
              child: CustomPaint(
                                painter: _HeaderTriangularDiagonalPainter(),
                        ),
            );
  }
}

class _HeaderTriangularDiagonalPainter extends CustomPainter{
  
  @override
  void paint(Canvas canvas, Size size) {
    
    final lapiz = new Paint();
    lapiz.color = Color(0xff615AAB);
    lapiz.style = PaintingStyle.fill; //bordes
    lapiz.strokeWidth = 5.0;

    //Dibujar con el lapiz y el path
    final path = new Path();
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    //path.lineTo(size.width, size.height);

    canvas.drawPath(path, lapiz);

    
  }



  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    
    return true;
  }

}


class HeaderPico extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
              height: double.infinity,
              width: double.infinity,
             // color: Color(0xff615AAB),
              child: CustomPaint(
                                painter: _HeaderPicoPainter(),
                        ),
            );
  }
}

class _HeaderPicoPainter extends CustomPainter{
  
  @override
  void paint(Canvas canvas, Size size) {
    
    final lapiz = new Paint();
    lapiz.color = Color(0xff615AAB);
    lapiz.style = PaintingStyle.fill; //bordes
    lapiz.strokeWidth = 5.0;

    //Dibujar con el lapiz y el path
    final path = new Path();
    path.lineTo(0, size.height * 0.4);
    path.lineTo(size.width * 0.5, size.height * 0.5);
    path.lineTo(size.width , size.height * 0.4);
    path.lineTo(size.width, 0);

    canvas.drawPath(path, lapiz);

    
  }
  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    
    return true;
  }

}



class HeaderCurvo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
              height: double.infinity,
              width: double.infinity,
             // color: Color(0xff615AAB),
              child: CustomPaint(
                                painter: _HeaderCurvoPainter(),
                        ),
            );
  }
}

class _HeaderCurvoPainter extends CustomPainter{
  
  @override
  void paint(Canvas canvas, Size size) {
    
    final lapiz = new Paint();
    lapiz.color = Color(0xff615AAB);
    lapiz.style = PaintingStyle.fill; //bordes
    lapiz.strokeWidth = 20.0;
    lapiz.strokeWidth = 5.0;

    //Dibujar con el lapiz y el path
    final path = new Path();
    path.lineTo(0, size.height * 0.25);
    //path.lineTo(size.width, size.height * 0.25);
    path.quadraticBezierTo(size.width * 0.55, size.height* 0.35, size.width, size.height * 0.25);
    path.lineTo(size.width, 0);
    canvas.drawPath(path, lapiz);

    
  }
@override
  bool shouldRepaint(CustomPainter oldDelegate) {
    
    return true;
  }

}

class HeaderWave extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
              height: double.infinity,
              width: double.infinity,
             // color: Color(0xff615AAB),
              child: CustomPaint(
                                painter: _HeaderWavePainter(),
                        ),
            );
  }
}

class _HeaderWavePainter extends CustomPainter{
  
  @override
  void paint(Canvas canvas, Size size) {
    
    final lapiz = new Paint();
    lapiz.color = Color(0xff615AAB);
    lapiz.style = PaintingStyle.fill; //bordes
    lapiz.strokeWidth = 20.0;
    lapiz.strokeWidth = 5.0;

    //Dibujar con el lapiz y el path
    final path = new Path();
    path.lineTo(0, size.height * 0.25);
    //path.lineTo(size.width, size.height * 0.25);
    path.quadraticBezierTo(size.width * 0.25, size.height * 0.35, size.width * 0.5, size.height * 0.25);
    path.quadraticBezierTo(size.width * 0.75, size.height * 0.15, size.width, size.height * 0.25);
    path.lineTo(size.width, 0);
    canvas.drawPath(path, lapiz);

    
  }
@override
  bool shouldRepaint(CustomPainter oldDelegate) {
    
    return true;
  }

}