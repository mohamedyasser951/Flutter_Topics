import 'dart:convert';

import 'package:flutter_topics/Data/passenger_model.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  static Future<PassengerModel> getPassengers({required int currentPage}) async {
    String mainUrl =
        "https://api.instantwebtools.net/v1/passenger?page=$currentPage&size=10";

    var response = await http.get(Uri.parse(mainUrl));
    if (response.statusCode != 200) {
      print("error ${response.statusCode}");
    }
    var data = jsonDecode(response.body);
    PassengerModel passengers = PassengerModel.fromJson(data);
    return passengers;
  }
}
