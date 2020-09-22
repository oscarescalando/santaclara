import 'dart:typed_data';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:santaclara/providers/db_provider.dart';
import 'package:santaclara/registerqr/ui/widget/info_widget.dart';
import 'package:santaclara/userbooking/bloc/myqrs_bloc.dart';
import 'package:santaclara/util/settings/data_constants.dart';
import 'package:santaclara/util/ui/widget/appBar_widget.dart';
import 'package:santaclara/util/ui/widget/logo_head.dart';
import 'package:santaclara/util/ui/widget/menuLateral_widget.dart';

class RegisterPage extends StatefulWidget {
  String id, dateBooking, starterPoint, startTime, bookingid, imgQR;

  RegisterPage(
      {Key key,
      this.id,
      this.dateBooking,
      this.starterPoint,
      this.startTime,
      this.bookingid,
      this.imgQR})
      : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String _base64;

  final myqrBloc = new MyQRBloc();

  // = widget.imgQR;
  // "data:image/png;base64,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";

  @override
  void initState() {
    _myQR();
    print('Register QR => ${widget.bookingid}');
  }

  @override
  Widget build(BuildContext context) {
    _base64 = widget.imgQR;
    Uint8List _bytes = base64.decode(_base64.split(',').last);

    return new Scaffold(
        appBar: AppBarPrincipal(backColor: naranjo),
        drawer: MenuLateral(),
        backgroundColor: grisFondo,
        //resizeToAvoidBottomPadding: false,
        body: SingleChildScrollView(
          child: Container(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                //LogoHead(titulo: "Welcome to Santa Clara"),
                LogoHead(
                  titulo: "Thank you for\n your registration",
                  extra_head: -20,
                ),
                SizedBox(
                  height: sizeBoxB1,
                ),
                InfoRegister(
                  info1: widget.dateBooking,
                  info2: widget.bookingid,
                  linea: 1,
                ),
                SizedBox(
                  height: sizeBoxB4,
                ),
                InfoRegister(
                  info1: widget.startTime,
                  info2: widget.starterPoint,
                  linea: 2,
                ),
                SizedBox(
                  height: sizeBoxB4,
                ),
                SizedBox(
                  height: 150,
                  width: 150,
                  child: Image.memory(
                    _bytes,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  height: sizeBoxB5,
                ),
                _boton(context),
              ],
            ),
          ),
        ));
  }

  Widget _boton(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(
          top: 10.0,
        ),
        child: MaterialButton(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0))),
          minWidth: 150.0,
          height: 50,
          onPressed: () {
            Navigator.of(context).pushNamed('/home');
          },
          color: grisFuentePPal,
          child: Text(
            "< BACK",
            style: TextStyle(
              color: Colors.white,
              fontSize: fontB2,
              fontWeight: FontWeight.w500,
            ),
          ),
        ));
  }

  _myQR() async {
    final myQR = MyQRModel(
        id: int.parse(widget.id),
        imgqr: widget.imgQR,
        infobooking: 'Register',
        bookingid: widget.bookingid,
        numberbooking: 1,
        datebooking: widget.dateBooking,
        player: 4);
    myqrBloc.agregarQR(myQR);
  }
}
