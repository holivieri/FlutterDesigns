import 'package:flutter/material.dart'; 
import 'dart:math' as Math;


class AnimacionesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: Center(child: CuadradoAnimado())
          );
  }
}

class CuadradoAnimado extends StatefulWidget {
  const CuadradoAnimado({
    Key key,
  }) : super(key: key);

  @override
  _CuadradoAnimadoState createState() => _CuadradoAnimadoState();
}

class _CuadradoAnimadoState extends State<CuadradoAnimado> with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> rotacion;

  @override
  void initState() { 

    controller = new AnimationController(vsync: this, duration: Duration(milliseconds: 4000));

    controller.addListener(() {
      print ('status: ' + controller.status.toString());
    });

    rotacion = Tween(begin: 0.0, end: 2 * Math.pi).animate(controller);
    super.initState();
    
  } 

  @override
  void dispose() {
    
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    //Play de la animacion
    controller.forward();
  

    return AnimatedBuilder( animation: controller, 
                            builder: (BuildContext context, Widget child){
                              print ( 'rotacion: ' + rotacion.value.toString());
                              return Transform.rotate(
                                              angle: rotacion.value,
                                              child: _Rectangulo()
                                            );
                            }

                            );
  }
}

class _Rectangulo extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
    return Container(
       width: 70,
       height: 70,
       decoration: BoxDecoration(
         color: Colors.blue
       ),
     );
   }
}