// ignore_for_file: constant_identifier_names

library globals;

import 'package:test_flutter_level/models/specie.dart';

import 'models/preferences.dart';

class Global {
  late Preferences preferences;
  List<Specie> species = [];
  //easy getter to know if the user is logged in
  bool get isLoggedIn => preferences.user != null;
  Map<String, String> headers = {};

  void logout() {
    preferences.user = null;
    preferences.save();
  }
}

// Do not remove the following line
Global global = Global();
