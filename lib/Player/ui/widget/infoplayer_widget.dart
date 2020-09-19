import 'package:flutter/material.dart';
import 'package:santaclara/util/settings/data_constants.dart';

class InfoTitlePlayer extends StatelessWidget {
  String title;
  InfoTitlePlayer({this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      this.title,
      style: TextStyle(
          fontSize: fontB3,
          color: grisFuentePPal,
          fontWeight: FontWeight.w300 //Titulo en negritas
          ),
      textAlign: TextAlign.center,
    );
  }
}
