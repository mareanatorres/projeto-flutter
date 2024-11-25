import 'package:flutter/foundation.dart';

class UserProvider with ChangeNotifier {
  String _username = '';
  String _ra = '';

  String get username => _username;
  String get ra => _ra;

  void updateUser(String username, String ra) {
    _username = username;
    _ra = ra;
    notifyListeners();
  }
}
