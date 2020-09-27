import 'package:http/http.dart' as http;

import 'dart:async';
import 'dart:convert';
import 'package:santaclara/util/settings/data_constants.dart';
import 'package:santaclara/Player/model/playes_model.dart';

class PlayersProvider {
  String id;

  static const headers = {
    'apiKey': '08d771e2-7c49-1789-0eaa-32aff09f1471',
    'Content-Type': 'application/json'
  };

  Future<List<Player>> getPlayers() async {
    final resp = await http.get("${api}booking/players/${this.id}");
    final decodeData = json.decode(resp.body);
    final players = new Players.fronJsonList(decodeData['data']);

    print(players.items);
    return players.items;
  }


  Future<bool> getNewPlayer(Player item) async {
    String url = api + 'players';
    print(url);
    var response = await http.post(
        url,
        headers: headers,
        body: json.encode(item.toJson()))
        .then((data) {
          if (data.statusCode == 201) {
            //return APIResponse<bool>(data: true);
            print('ok');
            return true;
          } else {
            print('error   ${data.statusCode}');
            return false;
          }
        })
        .catchError((_) =>
          print('An error occured')
          //return false
        );
  }
}
