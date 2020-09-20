import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:santaclara/Player/ui/screen/player_page.dart';

import 'package:santaclara/booking/model/booking_model.dart';
import 'package:santaclara/registerqr/ui/screen/register_page.dart';
import 'package:santaclara/util/settings/data_constants.dart';
import 'package:santaclara/util/ui/widget/appBar_widget.dart';
import 'package:santaclara/util/ui/widget/logo_head.dart';
import 'package:santaclara/util/ui/widget/menuLateral_widget.dart';

DateFormat format = DateFormat('E, dd MMM yyyy');

class BookingPage extends StatefulWidget {
  @override
  final Map<String, dynamic> dataBooking;
  BookingPage({Key key, @required this.dataBooking}) : super(key: key);
  _BookingPageState createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  var isLoading = false;
  bool _registerPlayer;
  String _imgQR;
  String get url_booking => "${api}booking/code/";

  @override
  void initState() {
    Booking booking = new Booking.fromJson(widget.dataBooking);
    print(booking.data[0].userStatus.toString());
  }

  @override
  Widget build(BuildContext context) {
    Booking booking = new Booking.fromJson(widget.dataBooking);
    var media = MediaQuery.of(context).size;

    final listBooking = ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: booking.data.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            height: 50,
            //color: Colors.amber[colorCodes[index]],
            child:
                Center(child: Text('Entry ${booking.data[index].startTime}')),
          );
        });

    return new Scaffold(
      appBar: AppBarPrincipal(backColor: naranjo),
      drawer: MenuLateral(),
      backgroundColor: grisFondo,
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
                        LogoHead(
                          titulo: "Your Bookings",
                          extra_head: 0,
                        ),
                        Text(
                          booking.data[0].bookedBy,
                          style: TextStyle(
                            color: naranjo,
                            fontSize: fontB2,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          format.format(DateTime.parse(
                              booking.data[0].bookingAt.toString())),
                          style: TextStyle(
                            color: grisFuenteSec,
                            fontSize: fontB3,
                            //fontWeight: FontWeight.w500,
                          ),
                        ),
                        SingleChildScrollView(
                          // child: Expanded(
                          child: ListView.builder(
                            shrinkWrap: true,
                            padding:
                                const EdgeInsets.only(left: 40.0, right: 40.0),
                            //padding: const EdgeInsets.all(8),
                            itemCount: booking.data.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Card(
                                child: ListTile(
                                  leading: Icon(Icons.access_time),
                                  title: Text(
                                      'Start Time: ${booking.data[index].startTime.substring(0, 5)}'),
                                  subtitle: Text(
                                      'Playes ${booking.data[index].playersNumber} - Starter Point ${booking.data[index].starterPoint.substring(0, 5)}'),
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => PlayerBooking(
                                              id: booking.data[index].id
                                                  .toString(),
                                              player: booking
                                                  .data[index].playersNumber,
                                              starterPoint: booking
                                                  .data[index].starterPoint
                                                  .substring(0, 5),
                                              startTime: booking
                                                  .data[index].startTime
                                                  .substring(0, 5),
                                              dateBooking: booking
                                                  .data[index].bookingAt
                                                  .toString()),
                                        ));
                                  },
                                  trailing: Icon(Icons.add),
                                ),
                              );
                            },
                          ),
                        ),
                        //),
                      ]))),
      floatingActionButton: _newButton(context),
    );
  }

  Widget _newButton(BuildContext context) {
    Booking booking = new Booking.fromJson(widget.dataBooking);
    return Row(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
      SizedBox(width: 50),
      FloatingActionButton.extended(
        heroTag: 'backHome',
        onPressed: () {
          //Navigator.of(context).pushNamed('/home');
          Navigator.pop(context);
        },
        backgroundColor: grisFuentePPal,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0))),
        label: Text(
          '< BACK',
          style: TextStyle(
            color: blanco,
            fontSize: fontB2,
            //fontWeight: FontWeight.w500,
          ),
        ),
      ),
      Expanded(child: SizedBox()),
      FloatingActionButton.extended(
        heroTag: 'checkIn',
        onPressed: () async {
          var resultOp = await getQrData(booking.data[0].id.toString());
          if (resultOp == true) {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => RegisterPage(
                    id: booking.data[0].id.toString(),
                    dateBooking: format.format(
                        DateTime.parse(booking.data[0].bookingAt.toString())),
                    startTime: booking.data[0].startTime.substring(0, 5),
                    starterPoint: booking.data[0].starterPoint.substring(0, 5),
                    bookingid: booking.data[0].number.toString(),
                    imgQR: _imgQR,
                  ),
                ));
          }
        },
        backgroundColor: naranjo,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0))),
        label: Text(
          'CHECK-IN >',
          style: TextStyle(
            color: blanco,
            fontSize: fontB2,
            //fontWeight: FontWeight.w500,
          ),
        ),
      ),
      SizedBox(width: 10),
    ]);
  }

  Future<bool> getQrData(String id) async {
    String _urlCode = url_booking + id;
    setState(() {
      isLoading = true;
    });

    var response;
    print(_urlCode);
    try {
      response = await http.get(Uri.encodeFull(_urlCode),
          headers: {"Accept": "application/json"});
    } catch (e) {
      //_errorMessage('Error: Connection refused');
      print(e.toString());
      return false;
    } finally {
      print('ok');
    }

    print(response);

    String status = response.statusCode.toString();

    print(status);
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
        //Map<String, dynamic> data = json.decode(response.body);
      } else if (status == '404') {
      } else {}
      setState(() {
        isLoading = false;
      });
      return false;
    } else {
      Map<String, dynamic> data = json.decode(response.body);
      print(data['data']);
      _imgQR = data['data'].toString();
      setState(() {
        isLoading = false;
      });

      print("Success!");
      return true;
    }
  }
}
