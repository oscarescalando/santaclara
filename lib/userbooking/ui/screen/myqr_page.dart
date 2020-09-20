import 'package:flutter/material.dart';
import 'package:santaclara/util/settings/data_constants.dart';
import 'package:santaclara/util/ui/widget/appBar_widget.dart';
import 'package:santaclara/util/ui/widget/logo_head.dart';
import 'package:santaclara/util/ui/widget/menuLateral_widget.dart';

class MyQrPage extends StatefulWidget {
  MyQrPage({Key key}) : super(key: key);

  @override
  _MyQrPageState createState() => _MyQrPageState();
}

class _MyQrPageState extends State<MyQrPage> {
  var isLoading = false;
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBarPrincipal(backColor: naranjo),
      drawer: MenuLateral(),
      backgroundColor: grisFondo,
      //resizeToAvoidBottomPadding: false,
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Container(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  //LogoHead(titulo: "Welcome to Santa Clara"),
                  LogoHead(
                    titulo: "My QR Code",
                    extra_head: 0,
                  ),
                  SizedBox(
                    height: sizeBoxB3,
                  ),
                ],
              ),
            )),
    );
  }
}
