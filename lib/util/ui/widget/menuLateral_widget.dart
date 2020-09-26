import 'dart:async';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:santaclara/util/settings/data_constants.dart';

class MenuLateral extends StatefulWidget {
  MenuLateral({Key key}) : super(key: key);

  @override
  _MenuLateralState createState() => _MenuLateralState();
}

class _MenuLateralState extends State<MenuLateral> {
  Future<void> _launched;
  AssetImage _imgBack = new AssetImage("assets/images/fotosantaclara.jpg");

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void didChangeDependencies() {
    precacheImage(_imgBack, context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return new Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          Container(
            color: naranjo,
            height: MediaQuery.of(context).size.height * 0.35,
            padding: EdgeInsets.zero,
            child: new UserAccountsDrawerHeader(
              accountName: Text("SANTA CLARA GOLF MARBELLA",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400)),
              //accountEmail: Text("info@santaclaragolfmarbella.com"),
              currentAccountPicture: Center(
                child: new Image(
                  image: new AssetImage('assets/images/logo.png'),
                  height: 280,
                  alignment: Alignment.center,
                ),
              ),
              // ),
              decoration: BoxDecoration(
                image: DecorationImage(image: _imgBack, fit: BoxFit.cover),
              ),
            ),
          ),
          Container(
              alignment: Alignment(-10.2, 0),
              padding: EdgeInsets.zero,
              width: MediaQuery.of(context).size.width,
              color: naranjo,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    _buildButtonColumn(
                        blanco, Icons.golf_course, 'Email', context, true, ''),
                    _buildButtonColumn(
                        blanco, Icons.email, 'Email', context, false, 'sms'),
                    _buildButtonColumn(blanco, Icons.settings_phone, 'Email',
                        context, false, 'santaclara'),
                    _buildButtonColumn(blanco, Icons.local_hospital, 'Email',
                        context, false, 'emergency')
                  ])),
          Container(
            padding: EdgeInsets.zero,
            width: MediaQuery.of(context).size.width,
            height: 60.0,
            color: naranjo,
            child: Align(
              alignment: Alignment(-0.4, -0.3),
              child: Text(
                "Ctra. N-340 Málaga Cádiz, \nKm. 187,5 Marbella - Málaga",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: fontB2,
                    fontWeight: FontWeight.w400),
              ),
            ),
          ),
          new ListTile(
              //child: Icon(Icons.keyboard_arrow_left),
              title: Text("HOME",
                  style: TextStyle(
                      fontSize: fontB3,
                      color: grisFuentePPal,
                      fontFamily: fontSecon,
                      fontWeight: FontWeight.w300)),
              onTap: () {
                Navigator.of(context).pushNamed('/home');
              }),
          Divider(),
          new ListTile(
            title: Text("TEAM REGISTER",
                style: TextStyle(
                    fontSize: fontB3,
                    color: grisFuentePPal,
                    fontFamily: fontSecon,
                    fontWeight: FontWeight.w300)),
            onTap: () {
              Navigator.of(context).pushNamed('/home');
            },
          ),
          Divider(),
          new ListTile(
              title: Text("MY QR CODE",
                  style: TextStyle(
                      fontSize: fontB3,
                      color: grisFuentePPal,
                      fontFamily: fontSecon,
                      fontWeight: FontWeight.w300)),
              onTap: () {
                Navigator.of(context).pushNamed('/myqr');
              }),
          Divider(),
        ],
      ),
    );
  }

  Column _buildButtonColumn(
      Color color, IconData icon, String label, BuildContext context,
      [bool isActive = false, String type = '']) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            width: MediaQuery.of(context).size.width * 0.18,
            height: 45,
            color: isActive != true ? naranjoSec : naranjo,
            //margin: EdgeInsets.all(20),
            child: IconButton(
              icon: Icon(icon, color: color),
              onPressed: () => setState(() {
                switch (type) {
                  case 'sms':
                    {
                      print('sms');
                      launch('sms:/$phoneSms');
                    }
                    break;
                  case 'santaclara':
                    {
                      print('santaclara');

                      _launched = _makePhoneCall('tel://$phoneSantaClara');

                      //launch('tel:$phoneSantaClara');
                    }
                    break;
                  case 'emergency':
                    {
                      launch('tel://$phoneEmergency');
                    }
                    break;
                  default:
                    {}
                    break;
                }
              }),
            )),
      ],
    );
  }

  Future<void> _makePhoneCall(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
