import 'package:flutter/material.dart';

bool isDark = false;
Color kPrimaryColor = isDark ? const Color(0xFFd8AA38) : Colors.blue;
Color kSecondaryColor = isDark ? const Color(0xFF787878) : Colors.grey[300]!;

List<Color> backgroundGradient = isDark
    ? [const Color(0xFF252525), Colors.black]
    : [Colors.blue[100]!, Colors.white];
List<Color> gridTileGradient = isDark
    ? [const Color(0xFF121212), Colors.black]
    : [Colors.blueGrey[50]!, Colors.white];
List<Color> gridBorderGradient = isDark
    ? [kPrimaryColor, const Color(0xFF141110)]
    : [kPrimaryColor, Colors.blueGrey];

Color kTextColor = isDark ? Colors.white : Colors.black;
Color imageColor = isDark ? Colors.white : Colors.blueGrey;
Color gridTileBGColor = isDark ? Colors.black : Colors.white;
Color gridTileBorderColor =
    isDark ? const Color(0xFF252525) : Colors.grey[300]!;
Color onOffStatusColor = isDark ? kSecondaryColor : Colors.blueGrey;

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
