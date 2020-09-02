import 'package:flutter/material.dart';

class SliderModel {
  String logoPath;
  String imagePath;
  String title;
  String desc1;
  String desc2;
  bool headLogo;

  SliderModel(
      {this.logoPath,
      this.imagePath,
      this.title,
      this.desc1,
      this.desc2,
      this.headLogo});

  void setLogoAssetPath(String getLogoPath) {
    logoPath = getLogoPath;
  }

  void setImageAssetPath(String getImagePath) {
    imagePath = getImagePath;
  }

  void setTitle(String getTitle) {
    title = getTitle;
  }

  void setDesc1(String getDesc1) {
    desc1 = getDesc1;
  }

  void setDesc2(String getDesc2) {
    desc2 = getDesc2;
  }

  void setHeadLogo(bool getHeadLogo) {
    headLogo = getHeadLogo;
  }

  String getLogoPath() {
    return logoPath;
  }

  String getImagePath() {
    return imagePath;
  }

  String getTitle() {
    return title;
  }

  String getDesc1() {
    return desc1;
  }

  String getDesc2() {
    return desc2;
  }

  bool getHeadLogo() {
    return headLogo;
  }
}

List<SliderModel> getSlides() {
  List<SliderModel> slides = new List<SliderModel>();
  SliderModel sliderModel = new SliderModel();

  //1
  sliderModel.setLogoAssetPath('assets/images/logo.png');
  sliderModel.setImageAssetPath('assets/images/a.png');
  sliderModel.setTitle('We care about \n your safety');
  sliderModel.setDesc1(
      'Due to Covid-19 outbreak, we \n are teaking extra precautions to \n keep our players and staff safe');
  sliderModel.setDesc2('');
  sliderModel.setHeadLogo(true);
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  //2
  sliderModel.setLogoAssetPath('assets/images/logo.png');
  sliderModel.setImageAssetPath('assets/images/b.png');
  sliderModel.setTitle('Before you visit us, \n you should');
  sliderModel.setDesc1(
      'Make a booking at our website or \n  email, and pay the fee. We are not \n admiting payments at the Golf Club \n for safety reasons. Kepp your \n BOOKING NUMBER to register.');
  sliderModel.setDesc2(
      "Make sure to bring your facemask, \n with you. If you don'n have one, \n our staff can provided it for you.");
  sliderModel.setHeadLogo(false);
  slides.add(sliderModel);

  sliderModel = new SliderModel();
  //3
  sliderModel.setLogoAssetPath('assets/images/logo.png');
  sliderModel.setImageAssetPath('assets/images/c.png');
  sliderModel.setTitle('When you arribe, \n follow this instructions');
  sliderModel.setDesc1(
      "Web established a contact-less procedure \n for your safety and confort. You'll need \n your BOOKING Number to create \n your access pass.");
  sliderModel.setDesc2(
      "You will only access when it's your \n start time, to accomplish social distancing. \n You'll have sealed water and hand \n sanitizer provided by our sraff.");
  sliderModel.setHeadLogo(false);
  slides.add(sliderModel);

  sliderModel = new SliderModel();
  //4
  sliderModel.setLogoAssetPath('assets/images/logo.png');
  sliderModel.setImageAssetPath('assets/images/d.png');
  sliderModel.setTitle('Thank you for \n trusting us and \n play safe!');
  sliderModel.setDesc1(
      'Welcome to Santa Clara Golf Club. \n We hope you enjoy the experience.');
  sliderModel.setDesc2('');
  sliderModel.setHeadLogo(false);
  slides.add(sliderModel);

  //sliderModel = new SliderModel();

  return slides;
}
