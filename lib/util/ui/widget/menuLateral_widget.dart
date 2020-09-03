import 'package:flutter/material.dart';
import 'package:santaclara/util/settings/data_constants.dart';

class MenuLateral extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height * 0.35,
            padding: EdgeInsets.zero,
            child: new UserAccountsDrawerHeader(
              accountName: Text("SANTA CLARA GOLF MARBELLA",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400)),
              //accountEmail: Text("info@santaclaragolfmarbella.com"),
              currentAccountPicture: new Container(
                alignment: Alignment.center,
                height: 100,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // decoration:  BoxDecoration(
                  //  image: DecorationImage(
                  children: <Widget>[
                    Image.asset('assets/images/logo.png'),
                  ],
                  //    fit: BoxFit.contain,

                  // ),
                ),
              ),
              // ),

              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                        "assets/images/fotosantaclara.jpg"), //NetworkImage("https://santaclaragolfmarbella.com/wp-content/uploads/2020/07/sc_fondoslider_home2-scaled.jpg"),
                    fit: BoxFit.cover), //color: Colors.green,
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
                        blanco, Icons.golf_course, 'Email', context, true),
                    _buildButtonColumn(blanco, Icons.email, 'Email', context),
                    _buildButtonColumn(
                        blanco, Icons.settings_phone, 'Email', context),
                    _buildButtonColumn(
                        blanco, Icons.local_hospital, 'Email', context)
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
                    fontSize: 18,
                    fontWeight: FontWeight.w400),
              ),
            ),
          ),
          new ListTile(
              //child: Icon(Icons.keyboard_arrow_left),
              title: Text("HOME",
                  style: TextStyle(
                      fontSize: 20,
                      color: grisFuentePPal,
                      fontWeight: FontWeight.w300)),
              onTap: () {
                Navigator.of(context).pushNamed('/home');
              }),
          Divider(),
          new ListTile(
            title: Text("TEAM REGISTER",
                style: TextStyle(
                    fontSize: 20,
                    color: grisFuentePPal,
                    fontWeight: FontWeight.w300)),
            onTap: () {
              Navigator.of(context).pushNamed('/home');
            },
          ),
          Divider(),
          new ListTile(
              title: Text("MY QR CODE",
                  style: TextStyle(
                      fontSize: 20,
                      color: grisFuentePPal,
                      fontWeight: FontWeight.w300)),
              onTap: () {
                Navigator.of(context).pushNamed('/home');
              }),
          Divider(),
        ],
      ),
    );
  }

  Column _buildButtonColumn(
      Color color, IconData icon, String label, BuildContext context,
      [isActive = false]) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.20,
          height: 45,
          color: isActive != true ? naranjoSec : naranjo,
          //margin: EdgeInsets.all(20),
          child: Icon(icon, color: color),
        ),

        /*Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        )*/
      ],
    );
  }
}
