import 'dart:developer';
import 'dart:ui';
import 'package:home_automation_ui/grid_tile_ui.dart';
import 'package:home_automation_ui/room_tabs_ui.dart';

import 'constants.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: GoogleFonts.kumbhSansTextTheme(),
      ),
      home: const MyHomePage(),
    );
  }
}



class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  MyConst cons = MyConst();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.center,
                colors: [
                  Color(0xFF252525),
                  Colors.black,
                ],
              ),
            ),
          ),
          CustomScrollView(
            scrollBehavior: CustomScroll(),
            slivers: [
              SliverAppBar(
                primary: true,
                title: Stack(
                  clipBehavior: Clip.none,
                  // alignment: Alignment.topRight,
                  children: [
                    Positioned(
                      right: -10,
                      child: Container(
                        height: 10,
                        width: 10,
                        decoration: BoxDecoration(
                          color: MyConst().primaryColor,
                          // shape: BoxShape.circle,
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                    ),
                    const Text(
                      "tempest",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ],
                ),
                actions: [
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Image.asset(
                      "assets/icon/add-icon.png",
                    ),
                  ),
                ],
                centerTitle: true,
                backgroundColor: Colors.transparent,
                elevation: 0.0,
                shadowColor: Colors.transparent,
              ),
              const SliverToBoxAdapter(
                child: SizedBox(height: 50),
              ),
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          Row(
                            children: const [
                              Text(
                                "Hello",
                                style: TextStyle(
                                  color: Colors.white54,
                                  fontSize: 25,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              const Text(
                                "Moritz",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 35,
                                    fontWeight: FontWeight.w800),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Image.asset(
                                    "assets/icon/sun.png",
                                    color: MyConst().primaryColor,
                                    height: 30,
                                  ),
                                  const Text(
                                    "16°C · NewYork",
                                    style: TextStyle(
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 40),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Row(
                          children: [
                            for (var i = 0; i < cons.room.length; i++)
                              // _roomTabs(cons.room[i], cons.roomState[i], i),
                              RoomTabs(
                                  title: cons.room[i],
                                  isActive: cons.roomState[i],
                                  index: i)
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                  ],
                ),
              ),
              // const SliverPadding(
              //   padding: EdgeInsets.only(top: 40),
              // ),
              // SliverToBoxAdapter(
              //   child: SingleChildScrollView(
              //     scrollDirection: Axis.horizontal,
              //     child: Padding(
              //       padding: const EdgeInsets.only(left: 20),
              //       child: Row(
              //         children: [
              //           for (var i = 0; i < _room.length; i++)
              //             _roomTabs(_room[i], _roomState[i], i),
              //         ],
              //       ),
              //     ),
              //   ),
              // ),
              // const SliverPadding(
              //   padding: EdgeInsets.only(top: 35),
              // ),
              SliverPadding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                sliver: SliverGrid(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 25.0,
                    crossAxisSpacing: 17.0,
                    childAspectRatio: 180 / 115,
                  ),
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      return index <= 1
                          ? LockGridTile(title: cons.electicApplianceTitle[index],
                              isLocked: cons.elecricApplianceState[index], index: index)
                          : ElectricApplianceGridTile(
                              image: cons.electicApplianceImages[index],
                              titleText: cons.electicApplianceTitle[index],
                              afterTitleText: cons.afterTitleText[index],
                              subtitle: cons.afterSubtitleText[index],
                              afterSubtitleText:
                                  cons.electricApplianceSubtitle[index],
                              footerImage: cons.gridFooter[index],
                              isLocked: cons.elecricApplianceState[index],
                              index: index);
                      // : _electricAppliancesGridTile(
                      //     cons.electicApplianceImages[index],
                      //     cons.electicApplianceTitle[index],
                      //     cons.afterTitleText[index],
                      //     cons.electricApplianceSubtitle[index],
                      //     cons.afterSubtitleText[index],
                      //     cons.gridFooter[index],
                      //     cons.elecricApplianceState[index],
                      //     index);
                    },
                    childCount: cons.electicApplianceImages.length,
                  ),
                ),
              ),
              const SliverPadding(padding: EdgeInsets.only(top: 90)),
            ],
          ),
          Positioned(
            bottom: 10,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  alignment: Alignment.center,
                  child: CustomPaint(
                    size: Size(MediaQuery.of(context).size.width, 100),
                    painter: MyCustomPainter(),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width - 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Icons.home_outlined,
                        color: cons.primaryColor,
                        size: 30,
                      ),
                      Image.asset(
                        "assets/icon/four-dots.png",
                        color: Colors.white,
                        height: 25,
                      ),
                      Stack(
                        children: [
                          Image.asset(
                            "assets/icon/bell.png",
                            color: Colors.white,
                            height: 25,
                          ),
                          Container(
                            height: 10,
                            width: 10,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: cons.primaryColor,
                            ),
                            child: const Text("2",
                                style: TextStyle(
                                    fontSize: 7, fontWeight: FontWeight.w800)),
                          ),
                        ],
                      ),
                      Image.asset(
                        "assets/icon/settings.png",
                        color: Colors.white,
                        height: 25,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Widget _electricAppliancesGridTile(
  //     String image,
  //     String titleText,
  //     String afterTitleText,
  //     String subtitle,
  //     String afterSubtitleText,
  //     String footerImage,
  //     bool isLocked,
  //     int index) {
  //   return GestureDetector(
  //     onTap: () {
  //       setState(() {
  //         cons.elecricApplianceState[index] =
  //             !cons.elecricApplianceState[index];
  //       });
  //     },
  //     child: SizedBox(
  //       height: 115,
  //       width: 180,
  //       child: DecoratedBox(
  //         decoration: BoxDecoration(
  //           borderRadius: BorderRadius.circular(12),
  //           color: isLocked ? null : const Color(0xFF252525),
  //           gradient: isLocked
  //               ? RadialGradient(
  //                   center: Alignment.topLeft,
  //                   radius: 1.3,
  //                   transform: const GradientRotation(0.5),
  //                   colors: [
  //                     cons.primaryColor,
  //                     const Color(0xFF141110),
  //                   ],
  //                 )
  //               : null,
  //         ),
  //         child: Container(
  //           decoration: BoxDecoration(
  //             borderRadius: BorderRadius.circular(12),
  //             gradient: isLocked
  //                 ? const LinearGradient(
  //                     begin: Alignment.topLeft,
  //                     colors: [
  //                       Color(0xFF121212),
  //                       Colors.black,
  //                     ],
  //                   )
  //                 : null,
  //             color: Colors.black,
  //           ),
  //           margin: const EdgeInsets.all(1.5),
  //           child: Padding(
  //             padding: const EdgeInsets.fromLTRB(12, 10, 10, 8),
  //             child: GridTile(
  //               header: Row(
  //                 mainAxisAlignment: MainAxisAlignment.end,
  //                 children: [
  //                   Padding(
  //                     padding: const EdgeInsets.only(top: 4),
  //                     child: Container(
  //                       height: 8,
  //                       width: 8,
  //                       decoration: BoxDecoration(
  //                         color: isLocked
  //                             ? cons.primaryColor
  //                             : cons.secondaryColor,
  //                         borderRadius: const BorderRadius.all(
  //                           Radius.circular(100),
  //                         ),
  //                       ),
  //                     ),
  //                   ),
  //                   const SizedBox(
  //                     width: 3,
  //                   ),
  //                   Padding(
  //                     padding: const EdgeInsets.only(top: 7),
  //                     child: Text(
  //                       isLocked ? "ON" : "OFF",
  //                       style: TextStyle(
  //                           color: isLocked
  //                               ? cons.primaryColor
  //                               : cons.secondaryColor,
  //                           fontSize: 11),
  //                     ),
  //                   )
  //                 ],
  //               ),
  //               child: Column(
  //                 crossAxisAlignment: CrossAxisAlignment.start,
  //                 children: [
  //                   Image.asset(
  //                     image,
  //                     height: 27,
  //                     color: Colors.white,
  //                   ),
  //                   const SizedBox(height: 7),
  //                   Row(
  //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                     children: [
  //                       Text(
  //                         titleText,
  //                         style: const TextStyle(
  //                             color: Colors.white,
  //                             fontWeight: FontWeight.w500,
  //                             fontSize: 16),
  //                       ),
  //                       Text(
  //                         afterTitleText,
  //                         style: const TextStyle(
  //                             color: Colors.white,
  //                             fontWeight: FontWeight.w500,
  //                             fontSize: 16),
  //                       ),
  //                     ],
  //                   ),
  //                   const SizedBox(height: 5),
  //                   Text(
  //                     subtitle,
  //                     style: const TextStyle(
  //                         color: Colors.grey,
  //                         fontWeight: FontWeight.w400,
  //                         fontSize: 10),
  //                   ),
  //                   const SizedBox(
  //                     height: 11,
  //                   ),
  //                   Text(
  //                     afterSubtitleText,
  //                     style: const TextStyle(
  //                       color: Colors.white,
  //                       fontWeight: FontWeight.w400,
  //                       fontSize: 12,
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //               footer: Align(
  //                 alignment: Alignment.bottomRight,
  //                 child: Image.asset(
  //                   footerImage,
  //                   height: 18,
  //                   color: cons.electicApplianceTitle[index] == "Studio Lamp"
  //                       ? const Color(0xFFA61D98)
  //                       : Colors.white,
  //                 ),
  //               ),
  //             ),
  //           ),
  //         ),
  //       ),
  //     ),
  //   );
  // }

  

  // Widget _roomTabs(String title, bool isActive, int index) {
  //   return GestureDetector(
  //     onTap: () {
  //       setState(() {
  //         cons.roomState[cons.previousIndex] = false;
  //         cons.roomState[index] = !cons.roomState[index];
  //         cons.previousIndex = index;
  //       });
  //     },
  //     child: Container(
  //       width: 105,
  //       height: 33,
  //       margin: const EdgeInsets.only(right: 10),
  //       alignment: Alignment.center,
  //       decoration: BoxDecoration(
  //         border: Border.all(
  //           color: isActive ? cons.primaryColor : cons.secondaryColor,
  //           width: 1,
  //         ),
  //         borderRadius: BorderRadius.circular(30),
  //       ),
  //       child: Text(
  //         title,
  //         style: const TextStyle(
  //           color: Colors.white,
  //           fontSize: 13,
  //         ),
  //       ),
  //     ),
  //   );
  // }
}


//To remove Scroll glow effect
class CustomScroll extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}

class MyCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint0 = Paint()
      ..color = Colors.white38
      ..style = PaintingStyle.fill
      ..strokeWidth = 2.0
      // ..shader = const LinearGradient(
      //   colors: [Colors.white38, Colors.white10],
      // ).createShader(Rect.fromLTWH(0, 0, size.width, size.height))
      // ..imageFilter = ImageFilter.blur(sigmaX: 3, sigmaY: 3)
      ..strokeCap = StrokeCap.round
      ..maskFilter = const MaskFilter.blur(BlurStyle.inner, 7.0)
      ..filterQuality = FilterQuality.high
      ..colorFilter = ColorFilter.mode(
        Colors.black.withOpacity(0.35),
        BlendMode.srcATop,
      );

    Path path0 = Path();
    path0.moveTo(size.width * 0.1500300, size.height * 0.1238500);
    path0.cubicTo(
        size.width * 0.0037200,
        size.height * 0.1023500,
        size.width * 0.0522600,
        size.height * 0.7552500,
        size.width * 0.1500500,
        size.height * 0.8761750);
    path0.cubicTo(
        size.width * 0.2767600,
        size.height * 0.8761750,
        size.width * 0.7234100,
        size.height * 0.8735500,
        size.width * 0.8501100,
        size.height * 0.8735500);
    path0.cubicTo(
        size.width * 0.9464300,
        size.height * 0.7575750,
        size.width * 0.9946900,
        size.height * 0.0944750,
        size.width * 0.8496900,
        size.height * 0.1268750);
    path0.cubicTo(
        size.width * 0.7230200,
        size.height * 0.1268750,
        size.width * 0.5303400,
        size.height * 0.1263500,
        size.width * 0.1500300,
        size.height * 0.1238500);
    path0.close();

    canvas.drawPath(path0, paint0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
