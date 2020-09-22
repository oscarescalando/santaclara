import 'package:flutter/material.dart';
import 'package:santaclara/providers/db_provider.dart';
import 'package:santaclara/userbooking/ui/widget/botonback_myqr.dart';
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
  void initState() {
    print('My QR');
  }

  @override
  Widget build(BuildContext context) {
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
              titulo: "My QR Code",
              extra_head: 0,
            ),
            SizedBox(
              height: sizeBoxB3,
            ),
            FutureBuilder<List<MyQRModel>>(
                future: DBProvider.db.getAllMyQR(),
                builder: (BuildContext context,
                    AsyncSnapshot<List<MyQRModel>> snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  final myQR = snapshot.data;

                  if (myQR.length == 0) {
                    return Center(
                      child: Text(
                        'The are no records',
                        style: TextStyle(
                          color: grisFuenteSec,
                          fontSize: fontB2,
                          //fontWeight: FontWeight.w500,
                        ),
                      ),
                    );
                  }

                  /* return Center(
                    child: Text(
                      myQR.length.toString(),
                      style: TextStyle(
                        color: grisFuenteSec,
                        fontSize: fontB2,
                        //fontWeight: FontWeight.w500,
                      ),
                    ),
                  );
*/
                  return SingleChildScrollView(
                    child: ListView.builder(
                      shrinkWrap: true,
                      padding: const EdgeInsets.only(left: 40.0, right: 40.0),
                      itemCount: myQR.length,
                      itemBuilder: (context, i) => Card(
                        child: ListTile(
                            leading: Icon(
                              Icons.golf_course,
                              color: naranjo,
                            ),
                            title: Text('Booking ${myQR[i].bookingid}'),
                            subtitle: Text('Date ${myQR[i].datebooking}'),
                            trailing: Icon(Icons.keyboard_arrow_right),
                            onTap: () {
                              print(myQR[i].id);
                            }),
                      ),
                    ),
                  );
                }),
          ],
        ),
      )),
      floatingActionButton: BotonBackMyQR(),
    );
  }
}
