import 'package:covid_tracker_app/model/WorldStateModel.dart';
import 'package:covid_tracker_app/services/utilities/app_url.dart';
import 'package:http/http.dart' as http;

import 'dart:convert';

class StatesServices {
  Future<WorldStateModel> fetchWorldStatesRecords() async {
    final response = await http.get(Uri.parse(AppUrl.worldStatesApi));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return WorldStateModel.fromJson(data);
    } else {
      throw Exception('Error');
    }
  }

  Future<List<dynamic>> countriesListAPI() async {
    var data;
    final response = await http.get(Uri.parse(AppUrl.countriesList));

    print(response.statusCode.toString());
    print(data);
    if (response.statusCode == 200) {
      data = jsonDecode(response.body.toString());
      return data;
    } else {
      throw Exception('Error');
    }
  }
}
