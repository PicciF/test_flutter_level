// ignore: avoid_web_libraries_in_flutter
// ignore_for_file: depend_on_referenced_packages

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:test_flutter_level/constants.dart';

import '../globals.dart';
import '../models/rest_response.dart';

// Do not forget to always throw in the case of an error.

Future<RestResponse> callApi(
  //BuildContext context,
  ApiMethods method, {
  String endpoint = "",
  Map<String, String> queryParameters = const {},
  Map<String, String>? headers,
  dynamic body,
}) async {
  http.Response rawResponse = http.Response("", 500);
  headers ??= {};
  headers["Content-Type"] ??= "application/x-www-form-urlencoded";
  RestResponse response;
  headers.addEntries(global.headers.entries);
  switch (method) {
    case ApiMethods.GET:
      var uri = BASE_URL + (endpoint.isEmpty ? "" : "/") + endpoint + queryString(queryParameters);
      debugPrint("GET: $uri headers: ${json.encode(headers)}");
      rawResponse = await http.get(Uri.parse(uri), headers: headers);
      debugPrint("GET: OK");
      break;
    case ApiMethods.POST:
      var uri = BASE_URL + (endpoint.isEmpty ? "" : "/") + endpoint + queryString(queryParameters);
      debugPrint("POST: $uri headers: ${json.encode(headers)} body: $body");
      rawResponse =
          await http.post(Uri.parse(uri), encoding: Encoding.getByName('utf-8'), headers: headers, body: body);
      debugPrint("POST: OK");
      break;
    default:
  }
  if (rawResponse.statusCode != 200) {
    throw rawResponse.body;
  } else {
    String body = rawResponse.body;
    var r = json.decode(body);
    response = RestResponse.fromJson(r);
  }
  return response;
}

String queryString(Map<String, String> queryParameters) {
  String result = "";
  if (queryParameters.isNotEmpty) {
    for (var parameter in queryParameters.entries) {
      result = result + ((result.isEmpty) ? "?" : "&");
      result = "$result${parameter.key}=${parameter.value}";
    }
  }
  return result;
}

enum ApiMethods {
  // ignore: constant_identifier_names
  GET,
  // ignore: constant_identifier_names
  POST,
}
