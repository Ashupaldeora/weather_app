import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class ApiServices {
  String baseUrl =
      "https://api.weatherapi.com/v1/current.json?key=27b9ae308b8541918e372538242906&q=";
  static ApiServices apiServices = ApiServices();
  Future<Map> fetchData(String query) async {
    Response response = await http.get(Uri.parse(baseUrl + query));
    if (response.statusCode == 200) {
      Map json = jsonDecode(response.body);
      return json;
    } else {
      throw "Unexpected Error Occurred";
    }
  }
}
