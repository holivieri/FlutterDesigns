import 'package:background/src/models/slider_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class SlideShowPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => new SlideModel(),
          child: Scaffold(
            body: Center(
                child: Column(
                  children: <Widget>[
                    Expanded(child: _Slides()),
                   _Dots(),
                  ],
                )
                )
          ),
    );
  }
}

class _Dots extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
                height: 70,
                width: double.infinity,
                child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                      _Dot(0),
                      _Dot(1),
                      _Dot(2),
                ])
    );
  }
}

class _Dot extends StatelessWidget {

  final int index;

  const _Dot(this.index);

  @override
  Widget build(BuildContext context) {
    final double currentPage = Provider.of<SlideModel>(context).currentPage;

    return AnimatedContainer(width: 12.0, 
              duration: Duration(milliseconds: 200),
              height: 12.0, 
              margin: EdgeInsets.symmetric(horizontal: 5.0),
              decoration: BoxDecoration(
                                  color: (index >= currentPage - 0.5 && index <= currentPage + 0.5
                                        ? Colors.purple : Colors.grey), 
                                  shape: BoxShape.circle)
                                  );
  }
}


class _Slides extends StatefulWidget {


  @override
  __SlidesState createState() => __SlidesState();
}

class __SlidesState extends State<_Slides> {

  final pageViewController = new PageController();

  @override
  void initState() { 
    
    super.initState();
    pageViewController.addListener((){ 
       print('pagina actual ${pageViewController.page}');
      Provider.of<SlideModel>(context, listen: false).currentPage = pageViewController.page;



    });
   


  }

  @override
  void dispose() { 
    pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
          child: PageView(
            controller: pageViewController,
            children: <Widget>[
                    _Slide('assets/svgs/1.svg'),
                    SvgPicture.asset('assets/svgs/2.svg'),
                    SvgPicture.asset('assets/svgs/3.svg'),
                    ],
            ),
    );
  }
}

class _Slide extends StatelessWidget {
  
  final String svg;

  const _Slide(this.svg);

  @override
  Widget build(BuildContext context) {
    //SvgPicture.asset('assets/svgs/1.svg');
    return Container(
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.all(30.0),
        child: SvgPicture.asset(svg),
    );
  }
}