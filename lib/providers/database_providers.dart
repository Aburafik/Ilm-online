import 'package:flutter/material.dart';

class DatabaseProvider extends ChangeNotifier {
  Map<String, dynamic> _newSermon = {};

  List<Map<String, dynamic>> _recentSermon = [];
  List<Map<String, dynamic>> _popularSermon = [];
  List<Map<String, dynamic>> _articles = [];

  Map<String, dynamic> get getNewSermon => _newSermon;
  List<Map<String, dynamic>> get getRecentSermon => _recentSermon;
  List<Map<String, dynamic>> get getpopularSermon => _popularSermon;
  List<Map<String, dynamic>> get getArticles => _articles;

  setNewSermon(value) {
    _newSermon = value;
    notifyListeners();
  }

  setRecentSermon(value) {
    _recentSermon = value;
    notifyListeners();
  }

  setPopularSermon(value) {
    _popularSermon = value;
    notifyListeners();
  }
   setArticles(value) {
    _articles = value;
    notifyListeners();
  }
}
