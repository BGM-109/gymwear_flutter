import 'dart:convert';

import 'package:gymwear_app/model/gymwear_model.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

class Network {
  static final String baseUrl =
      "${env['SECRET_BASE_URL']}api/gymwears?populate=*";

  static Future<List<GymwearModel>> getGymwears() async {
    final String uri = baseUrl;
    var response = await http.get(Uri.parse(uri));

    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      List<dynamic> data = json["data"];
      List<GymwearModel> results =
          data.map((obj) => GymwearModel.fromJson(obj["attributes"])).toList();
      return results;
    }

    return [];
  }
}
