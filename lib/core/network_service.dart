// import 'dart:convert';
//
// import 'package:gymwear_app/model/gymwear_model.dart';
// import 'package:http/http.dart' as http;
//
// class Network {
//   static const String baseUrl = "https://pixabay.com/api/";
//   static const String myKey = "7330360-e350122288fab0405c64b3e9f";
//
//   static Future<List<GymwearModel>> getPhotos(String keyword) async {
//     final String uri = "$baseUrl?key=$myKey&q=$keyword";
//     var response = await http.get(Uri.parse(uri));
//
//     if (response.statusCode == 200) {
//       var json = jsonDecode(response.body);
//       List<dynamic> hits = json["hits"];
//       List<GymwearModel> results = hits.map((obj) => GymwearModel.fromJson(obj)).toList();
//       return results;
//     }
//
//     return [];
//   }
// }