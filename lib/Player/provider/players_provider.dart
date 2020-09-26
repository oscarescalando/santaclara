import 'package:http/http.dart' as http;

import 'dart:async';
import 'dart:convert';
import 'package:santaclara/util/settings/data_constants.dart';
import 'package:santaclara/Player/model/playes_model.dart';

class PlayersProvider {
  String id;

  //PlayersProvider.setId({this.id});

  Future<List<Player>> getPlayers() async {
    final resp = await http.get("${api}booking/players/${this.id}");
    final decodeData = json.decode(resp.body);
    final players = new Players.fronJsonList(decodeData['data']);

    print(players.items);
    return players.items;

    //if (players.data.length > 0) {
    //return players.data;
    //} else {}
  }
}
