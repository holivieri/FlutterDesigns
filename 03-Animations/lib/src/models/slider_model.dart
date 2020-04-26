import 'package:flutter/material.dart';

class SlideModel with ChangeNotifier {

  double _currentPage = 0;

  double get currentPage => _currentPage;

  set currentPage(double value){
    _currentPage = value;
    notifyListeners();
  }

}
