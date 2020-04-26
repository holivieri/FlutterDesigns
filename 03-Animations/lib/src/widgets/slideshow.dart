import 'package:background/src/models/slider_model.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';




class Slideshow extends StatelessWidget {

  final List<Widget> slides;
  final bool dotsUp;
  final Color selectedColor;
  final Color unselectedColor;
  final double dotSize;


  const Slideshow({ @required this.slides, this.dotsUp = false, this.selectedColor = Colors.purple, this.unselectedColor = Colors.grey, this.dotSize = 12.0});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(  
      create: (_) => new SlideModel(),
      child: SafeArea(
            child: Center(
               child: Column(
                      children: <Widget>[
                       if( dotsUp ) _Dots(this.slides.length, selectedColor, unselectedColor, this.dotSize),
                        Expanded(
                          child: _Slides(this.slides)
                          ),
                       if( !dotsUp ) _Dots(this.slides.length,  selectedColor, unselectedColor, this.dotSize),
                      ],
                    ),
        ),
      ),
      );
  }
}


class _Dots extends StatelessWidget {

  final int slidescount;
  final Color selectedColor;
  final Color unselectedColor;
  final double dotSize;

  const _Dots(this.slidescount, this.selectedColor, this.unselectedColor, this.dotSize);

  @override
  Widget build(BuildContext context) {
    return Container(
                height: 70,
                width: double.infinity,
                child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(this.slidescount, (i) => _Dot(i, this.selectedColor, this.unselectedColor, this.dotSize))
                      )
    );
  }
}

class _Dot extends StatelessWidget {

  final int index;
  final Color selectedColor;
  final Color unselectedColor;
  final double dotSize;

  const _Dot(this.index, this.selectedColor, this.unselectedColor, this.dotSize);

  @override
  Widget build(BuildContext context) {
    final double currentPage = Provider.of<SlideModel>(context).currentPage;

    return AnimatedContainer(
              width: this.dotSize, 
              height: this.dotSize, 
              duration: Duration(milliseconds: 200),
              
              margin: EdgeInsets.symmetric(horizontal: 5.0),
              decoration: BoxDecoration(
                                  color: (index >= currentPage - 0.5 && index <= currentPage + 0.5
                                        ? selectedColor : unselectedColor), 
                                  shape: BoxShape.circle)
                                  );
  }
}


class _Slides extends StatefulWidget {

final List<Widget> slides;

  const _Slides(this.slides);


  @override
  __SlidesState createState() => __SlidesState();
}

class __SlidesState extends State<_Slides> {

  final pageViewController = new PageController();

  @override
  void initState() { 
    
    super.initState();
    pageViewController.addListener((){ 
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
            children: widget.slides.map((slide) => _Slide( slide )).toList(),
            ),
    );
  }
}

class _Slide extends StatelessWidget {
  
  final Widget slide;

  const _Slide(this.slide);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.all(30.0),
        child: slide,
    );
  }
}