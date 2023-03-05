import 'dart:convert';

import 'package:flutter_covid/Services/Utilities/app_url.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../Model/WorldStatsModel.dart';

class StatsServices{
  Future<WorldStatsModel> fetchWorldRecords() async{
    final response = await http.get(Uri.parse(AppUrl.worldstates));
    if ( response.statusCode == 200){
      var data = jsonDecode(response.body);
      return WorldStatsModel.fromJson(data);
    }else {
      throw Exception("Error");
    }
  }
  Future<List<dynamic>> countriesListApi() async{
    var data ;
    final response = await http.get(Uri.parse(AppUrl.Countries));
    if ( response.statusCode == 200){
       data = jsonDecode(response.body);
      return data;
    }else {
      throw Exception("Error");
    }
  }
}