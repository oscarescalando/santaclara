import 'package:flutter/material.dart';
import 'package:santaclara/util/settings/data_constants.dart';

class InfoRegister extends StatelessWidget {
  String info1, info2;
  int linea;

  InfoRegister({this.info1, this.info2, this.linea});

  @override
  Widget build(BuildContext context) {
    String _titulo1 = (this.linea == 1) ? 'DATE' : 'START TIME';
    String _titulo2 = (this.linea == 1) ? 'BOOKING NUMBER' : 'STARTER POINT';

    return Row(
      children: <Widget>[
        SizedBox(width: 50),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              _titulo1,
              style: TextStyle(
                color: naranjoSec,
              ),
            ),
            Text(this.info1),
          ],
        ),
        Expanded(child: SizedBox()),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              _titulo2,
              style: TextStyle(
                color: naranjo,
              ),
            ),
            Text(this.info2),
          ],
        ),
        SizedBox(width: 50),
      ],
    );
  }
}
