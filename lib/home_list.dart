import 'package:flutter/material.dart';
import 'package:flutter_template_login/screens/login2.dart';
import 'package:flutter_template_login/screens/login3.dart';
import 'package:flutter_template_login/screens/login4.dart';
import 'package:flutter_template_login/screens/login5.dart';
import 'package:flutter_template_login/screens/login6.dart';
import 'package:flutter_template_login/screens/login7.dart';
import 'package:flutter_template_login/screens/login8.dart';
import 'package:flutter_template_login/screens/login9.dart';
import 'package:flutter_template_login/screens/login10.dart';
import 'package:flutter_template_login/screens/login11.dart';
import 'package:flutter_template_login/screens/login12.dart';
import 'package:flutter_template_login/screens/login13.dart';
import 'package:flutter_template_login/ui/ui_helper.dart';

import 'screens/login1.dart';

class HomeList {
  Widget navigateScreen;
  String imagePath;

  HomeList({
    this.navigateScreen,
    this.imagePath = '',
  });

  static List<HomeList> homeList = [
    HomeList(
      imagePath: UIHelper.muzPhoto,
      navigateScreen: MuzLogin(),
    ),
    HomeList(
      imagePath: UIHelper.grapePhoto,
      navigateScreen: GrapeLogin(),
    ),
    HomeList(
      imagePath: UIHelper.strawberryPhoto,
      navigateScreen: StrawberryLogin(),
    ),
    HomeList(
      imagePath: UIHelper.blueberryPhoto,
      navigateScreen: BlueberryLogin(),
    ),
    HomeList(
      imagePath: UIHelper.pomegranatePhoto,
      navigateScreen: PomegranateLogin(),
    ),
    HomeList(
      imagePath: UIHelper.apricotPhoto,
      navigateScreen: ApricotLogin(),
    ),
    HomeList(
      imagePath: UIHelper.figPhoto,
      navigateScreen: FigLogin(),
    ),
    HomeList(
      imagePath: UIHelper.cherryPhoto,
      navigateScreen: CherryLogin(),
    ),
    HomeList(
      imagePath: UIHelper.applePhoto,
      navigateScreen: AppleLogin(),
    ),
    HomeList(
      imagePath: UIHelper.watermelonPhoto,
      navigateScreen: WatermelonLogin(),
    ),
    HomeList(
      imagePath: UIHelper.pineapplePhoto,
      navigateScreen: PineAppleLogin(),
    ),
    HomeList(
      imagePath: UIHelper.pearPhoto,
      navigateScreen: PearLogin(),
    ),
  ];
}
