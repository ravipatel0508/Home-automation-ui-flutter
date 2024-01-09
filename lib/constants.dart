import 'package:flutter/material.dart';

bool isDark = true;
Color kPrimaryColor = const Color(0xFFd8AA38);
Color kSecondaryColor = const Color(0xFF787878);
List<Color> backgroundGradient = [const Color(0xFF252525), Colors.black];
List<Color> gridTileGradient = [const Color(0xFF121212), Colors.black];
List<Color> gridBorderGradient = [kPrimaryColor, const Color(0xFF141110)];
Color kTextColor = Colors.white;
Color imageColor = Colors.white;
Color gridTileBGColor = Colors.black;
Color onOffStatusColor = kSecondaryColor;
Color gridTileBorderColor = const Color(0xFF252525);

const List<String> kRoomName = [
  "Living Room",
  "Kitchen",
  "Bedroom",
  "Bathroom",
  "Dining Room",
];

//  List<bool> roomState = [
//   true,
//   false,
//   false,
//   false,
//   false,
// ];
// //previousIndex is for the previous state of the room
// var previousIndex = 0;

const List<String> kElecticApplianceImages = [
  "",
  "",
  "assets/icon/hang-lamp.png",
  "assets/icon/hang-lamp.png",
  "assets/icon/coffee-machine.png",
  "assets/icon/ac.png",
  "assets/icon/monitor.png",
  "assets/icon/chandelier.png",
  "assets/icon/hang-lamp.png",
  "assets/icon/hang-lamp.png",
  "assets/icon/coffee-machine.png",
  "assets/icon/ac.png",
  "assets/icon/monitor.png",
  "assets/icon/chandelier.png",
];

const List<String> kElecticApplianceTitle = [
  "Gate 2",
  "Gate 1",
  "Studio Lamp",
  "Door Light",
  "Coffee Machine",
  "A.C.",
  "LR TV",
  "Chandelier",
  "Studio Lamp",
  "Door Light",
  "Coffee Machine",
  "A.C.",
  "LR TV",
  "Chandelier",
];

const List<String> kTitleTrailingText = [
  "",
  "",
  "",
  "",
  "",
  "23°",
  "",
  "",
  "",
  "",
  "",
  "23°",
  "",
  "",
];

const List<String> kSubtitleTrailingText = [
  "",
  "",
  "",
  "",
  "05:25 · Latte",
  "",
  "",
  "",
  "",
  "",
  "05:25 · Latte",
  "",
  "",
  "",
];

const List<String> kElectricApplianceSubtitle = [
  "",
  "",
  "Philips Hue",
  "Amazon 1",
  "Phillips Smart Brew",
  "LG Smart",
  "Smasung QLED",
  "",
  "Philips Hue",
  "Amazon 1",
  "Phillips Smart Brew",
  "LG Smart",
  "Smasung QLED",
  "",
];

const List<String> kGridFooter = [
  "",
  "",
  "assets/icon/dot.png",
  "assets/icon/wall-clock.png",
  "assets/icon/wall-clock.png",
  "assets/icon/left-arrow.png",
  "assets/icon/transperant-image.png",
  "assets/icon/wall-clock.png",
  "assets/icon/dot.png",
  "assets/icon/wall-clock.png",
  "assets/icon/wall-clock.png",
  "assets/icon/left-arrow.png",
  "assets/icon/transperant-image.png",
  "assets/icon/wall-clock.png",
];

List<bool> kElecricApplianceState = [
  false,
  true,
  true,
  false,
  true,
  true,
  false,
  false,
  true,
  false,
  true,
  true,
  false,
  false,
];
