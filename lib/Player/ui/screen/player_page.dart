import 'dart:async';
import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/services.dart' show rootBundle;
import 'package:santaclara/Player/ui/widget/botonback_palyer.dart';
import 'package:santaclara/Player/ui/widget/infoplayer_widget.dart';
import 'package:santaclara/Player/ui/widget/titleplayer_widget.dart';
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

  @override
  void initState() {
    super.initState();
    print(widget.id);
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
            ],
          ),
        ),
      ),
      floatingActionButton: BotonBackPlayer(),
    );
  }
}
