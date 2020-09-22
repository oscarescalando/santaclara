import 'package:flutter/material.dart';
import 'dart:io';
import 'package:santaclara/onboarding/model/slider_model.dart';
import 'package:santaclara/onboarding/ui/screen/widget/const_theme.dart';
import 'package:santaclara/onboarding/ui/screen/widget/sliderTile.dart';
import 'package:santaclara/util/settings/data_constants.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<SliderModel> slides = new List<SliderModel>();
  int currentIndex = 0;
  PageController pageController = new PageController(initialPage: 0);

  Widget pageIndexIndicator(bool isCurrentPAge) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 2.0),
      height: isCurrentPAge ? 10.0 : 6.0,
      width: isCurrentPAge ? 10.0 : 6.0,
      decoration: BoxDecoration(
        color: isCurrentPAge ? Colors.grey : Colors.green[300],
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    slides = getSlides();
  }

  @override
  Widget build(BuildContext context) {
    final double shortestSide = MediaQuery.of(context).size.shortestSide;
    final bool useMobileLayout = shortestSide < 600;
    final theme = ThemeLayout(isMobile: useMobileLayout);

    return Scaffold(
        backgroundColor: grisFondo,
        body: PageView.builder(
            controller: pageController,
            itemCount: slides.length,
            onPageChanged: (val) {
              setState(() {
                currentIndex = val;
              });
            },
            itemBuilder: (context, index) {
              return SliderTile(
                  logoAssetPath: slides[index].getLogoPath(),
                  imageAssetPath: slides[index].getImagePath(),
                  title: slides[index].getTitle(),
                  desc1: slides[index].getDesc1(),
                  desc2: slides[index].getDesc2(),
                  logoHead: slides[index].getHeadLogo());
            }),
        bottomSheet: currentIndex != slides.length - 1
            ? _navButon(theme.btnNav, theme.fontNav)
            : _butonEnd(theme.btnEnd, theme.fontBtn));
  }

  Widget _navButon(double btnNav, double fontNav) {
    return Container(
      height: btnNav, //Platform.isIOS ? btnNav : btnNav - 20,
      margin: EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          GestureDetector(
              onTap: () {
                pageController.animateToPage(slides.length - 1,
                    duration: Duration(milliseconds: 400),
                    curve: Curves.linear);
              },
              child: Text(
                'SKIP',
                style: TextStyle(
                  fontSize: fontNav,
                ),
              )),
          Row(
            children: [
              for (int i = 0; i < slides.length; i++)
                currentIndex == i
                    ? pageIndexIndicator(true)
                    : pageIndexIndicator(false),
            ],
          ),
          GestureDetector(
              onTap: () {
                pageController.animateToPage(
                  currentIndex + 1,
                  duration: Duration(milliseconds: 400),
                  curve: Curves.linear,
                );
              },
              child: Text(
                'NEXT',
                style: TextStyle(
                  fontSize: fontNav,
                ),
              )),
        ],
      ),
    );
  }

  Widget _butonEnd(double btnEnd, double fontBtn) {
    return Container(
      height: btnEnd, //Platform.isIOS ? btnEnd : btnEnd - 20,
      color: new Color.fromRGBO(232, 81, 30, 1),
      alignment: Alignment.center,
      //child: Text("GET STARTED NOW", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),),
      child: ButtonTheme(
        minWidth: double.infinity,
        child: MaterialButton(
          onPressed: () {
            Navigator.of(context).pushNamed('/home');
          },
          child: Text(
            "GET STARTED NOW",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: fontBtn,
            ),
          ),
        ),
      ),
    );
  }
}
