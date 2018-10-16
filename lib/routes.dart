import 'package:flutter/material.dart';

import 'autocomplete/autocomplete.dart';
import 'expanded/expanded.dart';
import 'nav/navigasi.dart';
import 'bubble/bubble_chat.dart';
import 'splashlogo/splash_logo.dart';
import 'rating/ratingpage.dart';
import 'appbarbottom/appbar_bottom_widget.dart';
import 'welcome/welcome.dart';
import 'test/tes.dart';
import 'carousel_pro/carousel_page.dart';

final routes = {
  "/autocomplete": (BuildContext context) => AutocompleteApp(),
  "/bubble": (BuildContext context) => BubbleScreen(),
  "/expanded": (BuildContext context) => ExpansionTileSample(),
  "/navigasi": (BuildContext context) => SecondPage(),
  "/rating": (BuildContext context) => Ratingpage(),
  "/splash": (BuildContext context) => LogoApp(),
  "/appbar": (BuildContext context) => AppBarBottomSample(),
  "/welcome": (BuildContext context) => WelcomeScreen(),
  "/tes": (BuildContext context) => MyApp(),
  "/carouselpro": (BuildContext context) => CarouselPage(),

};