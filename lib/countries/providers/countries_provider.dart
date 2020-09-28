import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

import 'package:santaclara/countries/model/countries_model.dart';

class CountriesProvider {
  List<dynamic> opciones = [];

  CountriesProvider() {
    //cargarData();
  }

  Future<List<dynamic>> cargarData() async {
    final resp = await rootBundle.loadString('data/countries_list.json');

    final dataMap = json.decode(resp);
    final country = new Countries.fronJsonList(dataMap['countries']);
    //print(opciones);
    return country.items;
  }

  Future<String> getMyCountry(String id) async {
    final resp = await rootBundle.loadString('data/countries_list.json');
    Map dataMap = json.decode(resp);
    opciones = dataMap['countries'];

    var country = opciones.where((e) => e['id'] == id);
    print(country);
    //return country.['name'].toString();
    //Map filtro = dataMap.entries.firstWhere((element) => false)
  }
}

//final countriesProvider = new _CountriesProvider();
