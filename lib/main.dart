import 'package:flutter/material.dart';

import 'onboarding/ui/screen/home_page.dart';
import 'routes/routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Santa Clara',
      theme: ThemeData(fontFamily: 'Lato'),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: getApplicationRoutes(),
      onGenerateRoute: (RouteSettings settings) {
        //print('Ruta llamada: ${settings.name}');
        return MaterialPageRoute(builder: (BuildContext contex) => HomePage());
      },
    );
  }
}
