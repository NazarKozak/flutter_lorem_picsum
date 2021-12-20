import 'package:http/http.dart' as http;

import 'package:flutter_lorem_picsum/core/config/config.dart';

class ApiService {
  Future<String> get(String method) async {
    final Uri url = Uri.parse("${ApiConstants.baseUrl}$method");
    print(url);
    final response = await http.get(url);

    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Failed to load data');
    }
  }

}