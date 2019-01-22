import 'dart:io';
import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';
import 'package:scoped_model/scoped_model.dart';


class MainModel extends Model {
  String _user = 'n';

  String get user => _user;
  
  Future setMethod(String value) async {
    _user = value;

    notifyListeners();
  }

  double _val;

  double get value => _val;
  void setVal(double value) {
    _val = value;

    notifyListeners();
  }

  static MainModel of(BuildContext context) => ScopedModel.of<MainModel>(context);
}
