// ignore_for_file: constant_identifier_names

library globals;

import 'models/preferences.dart';

class Global {
  late Preferences preferences;

  //easy getter to know if the user is logged in
  bool get isLoggedIn => preferences.user != null;

  void logout() {
    preferences.user = null;
    preferences.save();
  }
}

// Do not remove the following line
Global global = Global();
