
import 'dart:convert';

import 'package:http/http.dart';
import 'package:http/http.dart' as http;

class ProductApi {
  String api =
      "https://fakestoreapi.com/products?";

  Future<List> fetchData() async {
    Uri url = Uri.parse(api);
    Response response = await http.get(url);
    if (response.statusCode == 200) {
      final json = response.body;
      List data = jsonDecode(json);
      return data;
    } else {
      return [];
    }
  }
}
