import 'dart:async';
import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/services.dart' show rootBundle;
import 'package:santaclara/Player/ui/widget/botonback_palyer.dart';
import 'package:santaclara/Player/ui/widget/infoplayer_widget.dart';
import 'package:santaclara/Player/ui/widget/playerform_widget.dart';
import 'package:santaclara/Player/ui/widget/titleplayer_widget.dart';
import 'package:santaclara/Player/provider/players_provider.dart';
import 'package:santaclara/util/settings/data_constants.dart';
import 'package:santaclara/util/ui/widget/appBar_widget.dart';
import 'package:santaclara/util/ui/widget/menuLateral_widget.dart';

DateFormat format = DateFormat('E, dd MMM yyyy');

class PlayerBooking extends StatefulWidget {
  @override
  _PlayerBookingState createState() => _PlayerBookingState();
  String id, starterPoint, startTime, dateBooking;
  //Map<String, dynamic> players;
  int player;
  PlayerBooking(
      {Key key,
      this.id,
      this.player,
      this.starterPoint,
      this.startTime,
      this.dateBooking})
      : super(key: key);
}

class _PlayerBookingState extends State<PlayerBooking> {
  final _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> scaffolKey = new GlobalKey<ScaffoldState>();
  bool _isLoading = false;
  bool isEditing = false;
  String get _url => "${api}booking/players/";
  final _playersProvider = new PlayersProvider();

  @override
  void initState() {
    super.initState();
    _playersProvider.id = widget.id;
    if(isEditing) {
      setState(() {
        _isLoading = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBarPrincipal(backColor: naranjo),
      drawer: MenuLateral(),
      backgroundColor: grisFondo,
      key: scaffolKey,
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: sizeBoxB3,
              ),
              TitlePlayer(title: 'Register your team'),
              InfoTitlePlayer(
                  title: format.format(DateTime.parse(widget.dateBooking))),
              InfoTitlePlayer(title: 'Start time: ${widget.startTime}'),
              SizedBox(
                height: sizeBoxB5,
              ),
              _formPlayerData(),
            ],
          ),
        ),
      ),
      floatingActionButton: BotonBackPlayer(),
    );
  }

  Widget _formPlayerData() {
    int _nroReg = 0;
    return FutureBuilder(
      future: _playersProvider.getPlayers(),
      builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data.length > 0) {
            _nroReg = snapshot.data.length;
            //print('Nro register => ${snapshot.data.length}');
            //print('Nro player => ${widget.player}');

            //print(  snapshot.data[0].fullName);

            return Container(
              padding: const EdgeInsets.only(left:20.0,right: 20.0),
              child: Column(
                children: <Widget>[
                 for (int i = 1; i <= snapshot.data.length; i++)PlayerFormWidget(int.parse(widget.id), scaffolKey, i, snapshot.data[i-1].fullName, snapshot.data[i-1].email, snapshot.data[i-1].countryId, snapshot.data[i-1].id, true),
                  if(widget.player>_nroReg) for (int j = _nroReg; j <= widget.player-1; j++)PlayerFormWidget(int.parse(widget.id), scaffolKey, j+1),
                ],
              ),

            );
          } else {
            //print('0');
            return Container(
              padding: const EdgeInsets.only(left:20.0,right: 20.0),
              child: Column(
                children: <Widget>[
                  for (int i = 1; i <= widget.player; i++)PlayerFormWidget(int.parse(widget.id), scaffolKey, i),
                ],
              ),

            );
          }

        } else {
          return Container(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}
