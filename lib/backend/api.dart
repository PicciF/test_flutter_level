import 'package:test_flutter_level/constants.dart';
import 'package:test_flutter_level/models/specie.dart';

import 'api_utils.dart';

// This is the place where you find the apis

Future<List<Specie>> getSpeciesByCategory(String category) async {
  var response = await callApi(
    ApiMethods.GET,
    endpoint: 'species/category/$category',
    queryParameters: {
      "token": TOKEN,
    },
  );

  return (response.result as List<dynamic>).map((f) => Specie.fromJson(f)).toList();
}

Future<Specie> getSpecieDetailsByName(String name) async {
  name = name.replaceAll(" ", "%20");
  var response = await callApi(
    ApiMethods.GET,
    endpoint: 'species/$name',
    queryParameters: {
      "token": TOKEN,
    },
  );
  return Specie.fromJson(response.result.first);
}

Future<bool> apiLogin(String password) async {
  if (password == PASSWORD_DB) {
    return true;
  } else {
    return false;
  }
}
