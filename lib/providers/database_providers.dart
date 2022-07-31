import 'package:flutter/material.dart';

class DatabaseProvider extends ChangeNotifier {
  Map<String, dynamic> _newSermon = {};

  List<Map<String, dynamic>> _recentSermon=[];

  Map<String, dynamic> get getNewSermon => _newSermon;
  List<Map<String, dynamic>> get getRecentSermon => _recentSermon;

  setNewSermon(value) {
    _newSermon = value;
    notifyListeners();
  }

  setRecentSermon(value) {
    _recentSermon = value;
    notifyListeners();
  }
}
