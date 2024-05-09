import 'dart:io';

import 'package:path_provider/path_provider.dart';

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

  save(String fileName, String fileContent) async {
    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/$fileName');
    await file.writeAsString(fileContent);
  }
}
