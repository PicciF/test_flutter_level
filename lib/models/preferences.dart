// ignore_for_file: depend_on_referenced_packages

import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:test_flutter_level/backend/datastore.dart';
import 'package:test_flutter_level/constants.dart';
import 'package:test_flutter_level/models/user.dart';

part 'preferences.g.dart';

@JsonSerializable(includeIfNull: false)
class Preferences {
  // this variables will be saved in the preferences file
  User? user;

  Preferences({
    this.user,
  });
  factory Preferences.fromJson(Map<String, dynamic> json) => _$PreferencesFromJson(json);
  Map<String, dynamic> toJson() => _$PreferencesToJson(this);

  //empty constructor
  Preferences.empty() : user = null;

  void save() {
    DataStore().save(PREFS_FILE_NAME, json.encode(toJson()));
  }

  Future<Preferences> read() async {
    if (await DataStore().exists(PREFS_FILE_NAME)) {
      String text = await DataStore().read(PREFS_FILE_NAME);
      return Preferences.fromJson(json.decode(text));
    } else {
      return Preferences.empty();
    }
  }
}
