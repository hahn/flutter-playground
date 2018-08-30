import 'package:flutter/material.dart';

import 'autocomplete/autocomplete.dart';
import 'expanded/expanded.dart';
import 'nav/navigasi.dart';
import 'bubble/bubble_chat.dart';
import 'splashlogo/splash_logo.dart';
import 'rating/ratingpage.dart';

final routes = {
  "/autocomplete": (BuildContext context) => AutocompleteApp(),
  "/bubble": (BuildContext context) => BubbleScreen(),
  "/expanded": (BuildContext context) => ExpansionTileSample(),
  "/navigasi": (BuildContext context) => SecondPage(),
  "/rating": (BuildContext context) => Ratingpage(),
  "/splash": (BuildContext context) => LogoApp(),

};