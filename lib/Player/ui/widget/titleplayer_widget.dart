import 'package:flutter/material.dart';
import 'package:santaclara/util/settings/data_constants.dart';

class TitlePlayer extends StatelessWidget {
  String title;
  TitlePlayer({this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      this.title,
      style: TextStyle(
          fontSize: fontTitle2,
          color: grisFuentePPal,
          fontWeight: FontWeight.w400 //Titulo en negritas
          ),
      textAlign: TextAlign.center,
    );
  }
}
