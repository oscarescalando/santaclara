import 'package:flutter/material.dart';
import 'package:santaclara/util/settings/data_constants.dart';

class BotonBackMyQR extends StatefulWidget {
  BotonBackMyQR({Key key}) : super(key: key);

  @override
  _BotonBackMyQRState createState() => _BotonBackMyQRState();
}

class _BotonBackMyQRState extends State<BotonBackMyQR> {
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
