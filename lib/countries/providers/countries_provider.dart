import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

class _CountriesProvider {
  List<dynamic> opciones = [];

  _CountriesProvider() {
    //cargarData();
  }

  Future<List<dynamic>> cargarData() async {
    final resp = await rootBundle.loadString('data/countries_list.json');

    Map dataMap = json.decode(resp);
    opciones = dataMap['countries'];

    return opciones;
  }
}

final menuProvider = new _CountriesProvider();
