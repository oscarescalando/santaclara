import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:santaclara/Player/ui/screen/player_page.dart';

import 'package:santaclara/booking/model/booking_model.dart';
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
  @override
  void initState() {}
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
      body: SingleChildScrollView(
          child: Container(
              alignment: Alignment.center,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    //LogoHead(titulo: "Welcome to Santa Clara"),
                    LogoHead(titulo: "Your Bookings"),

                    Text(
                      booking.data[0].bookedBy,
                      style: TextStyle(
                        color: naranjo,
                        fontSize: fontB2,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      format.format(
                          DateTime.parse(booking.data[0].bookingAt.toString())),
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
                        padding: const EdgeInsets.only(left: 40.0, right: 40.0),
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
                                          id: booking.data[index].id.toString(),
                                          player:
                                              booking.data[index].playersNumber,
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
    );
  }
}
