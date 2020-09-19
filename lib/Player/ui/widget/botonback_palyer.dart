import 'package:flutter/material.dart';
import 'package:santaclara/util/settings/data_constants.dart';

class BotonBackPlayer extends StatefulWidget {
  BotonBackPlayer({Key key}) : super(key: key);

  @override
  _BotonBackPlayerState createState() => _BotonBackPlayerState();
}

class _BotonBackPlayerState extends State<BotonBackPlayer> {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.pop(context);
      },
      tooltip: 'Go back',
      child: Icon(Icons.keyboard_arrow_left),
      backgroundColor: grisFuentePPal,
    );
  }
}
