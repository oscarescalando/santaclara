import 'package:flutter/material.dart';
import 'package:santaclara/booking/model/booking_model.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:santaclara/booking/ui/screen/booking_page.dart';

import 'package:santaclara/util/settings/data_constants.dart';
import 'package:santaclara/util/ui/widget/appBar_widget.dart';
import 'package:santaclara/util/ui/widget/logo_head.dart';
import 'package:santaclara/util/ui/widget/menuLateral_widget.dart';

class CheckingPage extends StatefulWidget {
  CheckingPage({Key key}) : super(key: key);

  @override
  _CheckingPageState createState() => _CheckingPageState();
}

class _CheckingPageState extends State<CheckingPage> {
  var isLoading = false;
  String get url_booking => "${api}bookings/validate/";
  final myController = TextEditingController();
  final myResult = TextEditingController();
  Map<String, dynamic> _dataToBooking;

  String _errorApi = '';

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    myResult.dispose();
    //super.dispose();
  }

  //disparador de mensaje de error
  void _errorMessage(String strError) {
    setState(() {
      _errorApi = strError;
    });
  }

  @override
  Widget build(BuildContext context) {
    //Formulario para validar booking
    final _singleForm = Container(
        margin: EdgeInsets.only(top: 10.0, left: 80.0, right: 80.0),
        //margin: EdgeInsets.only(top: 10.0, left: 80.0, right: 80.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                color: Colors.white60,
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
              child: TextField(
                autofocus: true,
                autocorrect: false,
                controller: myController,
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.send,
                decoration: InputDecoration(
                  hintText: 'Ex: 000000',
                ),
              ),
            ),
            Container(
                margin: EdgeInsets.only(
                  top: 10.0,
                ),
                child: MaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  minWidth: 220.0,
                  height: 50,
                  onPressed: () async {
                    var resultOp = await getData();
                    if (resultOp == true) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                BookingPage(dataBooking: _dataToBooking),
                          ));
                    }
                  },
                  color: naranjo,
                  child: Text(
                    "ACCESS YOUR PASS",
                    style: TextStyle(color: Colors.white),
                  ),
                )),
          ],
        ));

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
                            titulo: "Welcome to Santa Clara",
                            extra_head: 0,
                          ),
                          SizedBox(
                            height: sizeBoxB3,
                          ),

                          _description,
                          _singleForm,
                          SizedBox(
                            height: sizeBoxB3,
                          ),
                          Text(
                            '$_errorApi',
                            style: TextStyle(
                                fontSize: 22.0,
                                color: new Color.fromRGBO(60, 60, 60, 1),
                                fontWeight: FontWeight.w300 //Titulo en negritas
                                ),
                            textAlign: TextAlign.center,
                          ),
                        ]))));
  }

  final _description = Container(
    child: Text(
      "REGISTER YOUR \n BOOKING NUMBER",
      style: TextStyle(
          color: grisFuentePPal, fontSize: fontB3, fontWeight: FontWeight.w300),
      textAlign: TextAlign.center,
    ),
  );

  Future<bool> getData() async {
    if (myController.text.length < 1) {
      _errorMessage('Booking is required');
    } else {
      //creo un estatus de proload
      setState(() {
        isLoading = true;
      });
      var response;
      print('URL ${url_booking}${myController.text.toString()}');
      try {
        response = await http.get(
            Uri.encodeFull(url_booking + myController.text),
            headers: {"Accept": "application/json"});
      } catch (e) {
        _errorMessage('Error: Connection refused');
        print(e.toString());
        return false;
      } finally {
        print('ok');
      }

      String status = response.statusCode.toString();
      // 422 the booking data has expired
      // 400 Bad Request
      // 401 unauthorized
      // 403 Forbidden
      // 404 Not found
      // 500 Internal Error
      if (status == '404' ||
          status == '401' ||
          status == '422' ||
          status == '403' ||
          status == '400' ||
          status == '500') {
        print('Result ${response.statusCode}');
        if (status == '422') {
          Map<String, dynamic> data = json.decode(response.body);
          _errorMessage(data['message'].toString());
        } else if (status == '404') {
          _errorMessage('Booking Not Found');
        } else {
          _errorMessage('${response.statusCode}');
        }
        setState(() {
          isLoading = false;
        });
        return false;
      } else {
        Map<String, dynamic> data = json.decode(response.body);
        print(data['status_code']);

        _dataToBooking = data;

        Booking booking = new Booking.fromJson(data);

        booking.data.forEach((element) {
          //print(element.id);
        });

        print("Success!");
        _errorMessage('');
        setState(() {
          isLoading = false;
        });
        return true;
      }
    }
  }
}
