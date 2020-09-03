import 'package:flutter/material.dart';

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
  Widget build(BuildContext context) {
    return Container(
        //child: child,
        );
  }
}
