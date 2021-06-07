import 'package:flutter/material.dart';

class FilterControl extends ChangeNotifier {
  bool _gluten = false;
  bool _lactose = false;
  bool _vegan = false;
  bool _vegetarian = false;

  bool get gluten {
    return _gluten;
  }

  bool get lactose {
    return _lactose;
  }

  bool get vegan {
    return _vegan;
  }

  bool get vegetarian {
    return _vegetarian;
  }

  void setControl() {
    if(_gluten == false)_gluten=true;
    if(_lactose == false)_lactose=true;
    if(_vegan == false)_vegan=true;
    if(_vegetarian == false)_vegetarian=true;
    else{
      _gluten=false;
      _lactose=false;
      _vegan=false;
      _vegetarian=false;
    }
    notifyListeners();
  }
}
