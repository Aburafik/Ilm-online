import 'package:flutter/material.dart';

class UserProvider with ChangeNotifier {
  String? _userID;
  String _userName = "";
  int _notificationCount = 0;
  Map _userData = {};

  Map get userData => _userData;

  setUserData(Map userData) {
    _userData = userData;
    notifyListeners();
  }

  String? _userProfileImage;

  String get userProfileImage => _userProfileImage!;

  String get userID => _userID!;
  String get userName => _userName;
  int get notificationCount => _notificationCount;

  setUserProfileImage(image) {
    _userProfileImage = image;

    notifyListeners();
  }

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
