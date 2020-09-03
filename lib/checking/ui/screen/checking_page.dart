import 'package:flutter/material.dart';
import 'package:santaclara/util/settings/data_constants.dart';
import 'package:santaclara/util/ui/widget/appBar_widget.dart';
import 'package:santaclara/util/ui/widget/menuLateral_widget.dart';

class CheckingPage extends StatefulWidget {
  CheckingPage({Key key}) : super(key: key);

  @override
  _CheckingPageState createState() => _CheckingPageState();
}

class _CheckingPageState extends State<CheckingPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBarPrincipal(backColor: naranjo),
      drawer: MenuLateral(),
      backgroundColor: grisFondo,
      body: Container(),
    );
  }
}
