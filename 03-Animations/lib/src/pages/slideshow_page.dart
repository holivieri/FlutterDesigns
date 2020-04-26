import 'package:background/src/widgets/slideshow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SlideshowPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
            body: Slideshow(
              selectedColor: Colors.purple,
              unselectedColor: Colors.grey,
              //dotSize: 30.0,
              slides: <Widget>[
                SvgPicture.asset('assets/svgs/1.svg'),
                SvgPicture.asset('assets/svgs/2.svg'),
                SvgPicture.asset('assets/svgs/3.svg'),
                SvgPicture.asset('assets/svgs/4.svg'),
                SvgPicture.asset('assets/svgs/5.svg'),
                SvgPicture.asset('assets/svgs/6.svg'),
                SvgPicture.asset('assets/svgs/7.svg'),
                SvgPicture.asset('assets/svgs/8.svg'),

              ],
            )
            );
  }
}