import 'package:flutter/material.dart';

class UserProvider with ChangeNotifier {
  String? _userID;
  String _userName="";
  int _notificationCount = 0;

  String get userID => _userID!;
  String get userName => _userName;
  int get notificationCount => _notificationCount;

  setNotificationsCountFromDB({int? count}) {
    _notificationCount = count!;
    notifyListeners();
  }

  setUserName(String name) {
    _userName = name;

    notifyListeners();
  }

  setUserID(String? id) {
    _userID = id!;
    notifyListeners();
  }

  int _selectedIndex = 0;

  get selectedIndex => _selectedIndex;

  ontap(index) {
    _selectedIndex = index;
    notifyListeners();
  }
}
