import 'package:flutter/material.dart';
import 'package:santaclara/util/settings/data_constants.dart';
import 'package:santaclara/util/ui/widget/appBar_widget.dart';
import 'package:santaclara/util/ui/widget/menuLateral_widget.dart';

class PlayerBooking extends StatefulWidget {
  @override
  _PlayerBookingState createState() => _PlayerBookingState();
  String id, starterPoint, startTime, dateBooking;
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
  @override
  void initState() {}
  @override
  Widget build(BuildContext context) {
    new Scaffold(
        appBar: AppBarPrincipal(backColor: naranjo),
        drawer: MenuLateral(),
        backgroundColor: grisFondo,
        body: SingleChildScrollView(
          child: Container(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: sizeBoxB3,
                ),
              ],
            ),
          ),
        ));
  }
}
