import 'package:flutter/material.dart';
import 'package:santaclara/checking/ui/screen/checking_page.dart';
import 'package:santaclara/onboarding/ui/screen/home_page.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    '/': (BuildContext context) => new HomePage(),
    '/home': (BuildContext context) => new CheckingPage(),
  };
}
