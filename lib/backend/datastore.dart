// ignore_for_file: depend_on_referenced_packages

import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:path_provider/path_provider.dart';
import 'package:test_flutter_level/constants.dart';

class DataStore {
  Future<String> read(String fileName) async {
    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/$fileName');
    String text = await file.readAsString();
    return text;
  }

  Future<bool> exists(String fileName) async {
    bool result;
    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/$fileName');
    result = await file.exists();
    return result;
  }

  Future<void> save(String fileName, String fileContent) async {
    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/$fileName');
    await file.writeAsString(fileContent);
  }

  Future<void> savePrefsWeb(Map toJson) async {
    const storage = FlutterSecureStorage();
    try {
      await storage.write(key: PREFS_FILE_NAME, value: json.encode(toJson));
    } catch (e) {
      debugPrint("Error in saving prefs web: $e");
    }
  }
}
