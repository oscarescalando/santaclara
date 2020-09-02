import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

class _SliderProvider {
  List<dynamic> opciones = [];

  _SliderProvider() {
    //cargarData();
  }

  Future<List<dynamic>> cargarData() async {
    final resp = await rootBundle.loadString('data/slider_data.json');

    Map dataMap = json.decode(resp);
    opciones = dataMap['slider'];

    return opciones;
  }
}

final sliderProvider = new _SliderProvider();
