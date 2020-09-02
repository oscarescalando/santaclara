import 'package:flutter/material.dart';

const api = 'https://www.appsantaclara.com/api/v1/';

const shadows = [
  BoxShadow(
    color: Colors.black38,
    offset: Offset(1.0, 1.0),
    blurRadius: 5.0,
    spreadRadius: 5.0,
  ),
];

Color naranjo = const Color(0xffe84f1c);
Color grisFondo = const Color(0xffededed);
Color grisSombra = const Color(0xffdadada);
Color grisFuentePPal = const Color(0xff706f6f);
Color grisFuenteSec = const Color(0xff9d9d9c);
Color blanco = const Color(0xffffffff);
const int countSilder = 4;

class ThemeLayout {
  double btnEnd,
      btnNav,
      fontNav,
      fontBtn,
      logoHeight,
      logoImage,
      backImage,
      fontH1,
      fontH2,
      fontH3,
      sizeBoxH1,
      sizeBoxH2,
      sizeBoxH3,
      heightFooter,
      sizeFooter,
      logoFooter;
  bool isMobile;

  ThemeLayout({this.isMobile}) {
    if (isMobile) {
      this.btnEnd = 70;
      this.btnNav = 50;
      this.fontBtn = 15.0;
      this.fontNav = 12.0;
      this.logoHeight = 40.0;
      this.logoImage = 80.0;
      this.fontH1 = 22.0;
      this.fontH2 = 15.0;
      this.fontH3 = 12.0;
      this.sizeBoxH1 = 22;
      this.sizeBoxH2 = 20;
      this.sizeBoxH3 = 12;
      this.backImage = 200;
      this.sizeFooter = 25.0;
    } else {
      this.btnEnd = 100;
      this.btnNav = 100;
      this.fontNav = 25.0;
      this.fontBtn = 30.0;
      this.logoHeight = 60.0;
      this.logoImage = 160.0;
      this.fontH1 = 42.0;
      this.fontH2 = 30.0;
      this.fontH3 = 12.0;
      this.sizeBoxH1 = 22;
      this.sizeBoxH2 = 20;
      this.sizeBoxH3 = 12;
      this.backImage = 400;
      this.sizeFooter = 45.0;
    }
  }
}
