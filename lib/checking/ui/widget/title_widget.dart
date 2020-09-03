import 'package:flutter/material.dart';
import 'package:santaclara/util/settings/data_constants.dart';

class TitleChecking extends StatelessWidget {
  const TitleChecking({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Text("Welcome to \n Santa Clara",
          style: TextStyle(
              fontSize: fontTitle,
              //letterSpacing: 0.1,
              color: grisFuentePPal,
              fontWeight: FontWeight.w300 //Titulo en negritas
              ),
          textAlign: TextAlign.center),
    );
  }
}
