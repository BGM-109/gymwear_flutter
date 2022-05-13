import 'dart:convert';

import 'package:gymwear_app/model/gymwear_model.dart';
import 'package:http/http.dart' as http;

class Network {
  static const String baseUrl = "https://tranquil-ravine-04015.herokuapp.com/api/gymwears?populate=*";

  static Future<List<GymwearModel>> getGymwears() async {
    const String uri = baseUrl;
    var response = await http.get(Uri.parse(uri));

    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      List<dynamic> data = json["data"];
      List<GymwearModel> results = data.map((obj) => GymwearModel.fromJson(obj["attributes"])).toList();
      return results;
    }

    return [];
  }
}