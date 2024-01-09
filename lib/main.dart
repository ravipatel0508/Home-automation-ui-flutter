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
      title: 'Home Automation UI',
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.center,
                colors: backgroundGradient,
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
                  children: [
                    Positioned(
                      right: -10,
                      child: Container(
                        height: 10,
                        width: 10,
                        decoration: BoxDecoration(
                          color: kPrimaryColor,
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                    ),
                    Text(
                      "tempest",
                      style: TextStyle(
                        color: kTextColor,
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
                      color: imageColor,
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
                          const Row(
                            children: [
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
                              Text(
                                "Moritz",
                                style: TextStyle(
                                    color: kTextColor,
                                    fontSize: 35,
                                    fontWeight: FontWeight.w800),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Image.asset(
                                    "assets/icon/sun.png",
                                    color: kPrimaryColor,
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
                    SizedBox(
                      height: 33,
                      child: ListView.builder(
                        padding: const EdgeInsets.only(left: 20),
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: kRoomName.length,
                        itemBuilder: (context, index) => RoomTabs(
                          title: kRoomName[index],
                          index: index,
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                  ],
                ),
              ),
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
                          ? LockGridTile(
                              title: kElecticApplianceTitle[index],
                              isLocked: kElecricApplianceState[index],
                              index: index)
                          : ElectricApplianceGridTile(
                              image: kElecticApplianceImages[index],
                              titleText: kElecticApplianceTitle[index],
                              afterTitleText: kTitleTrailingText[index],
                              subtitle: kSubtitleTrailingText[index],
                              afterSubtitleText:
                                  kElectricApplianceSubtitle[index],
                              footerImage: kGridFooter[index],
                              isLocked: kElecricApplianceState[index],
                              index: index,
                            );
                    },
                    childCount: kElecticApplianceImages.length,
                  ),
                ),
              ),
              const SliverPadding(padding: EdgeInsets.only(top: 90)),
            ],
          ),
          Positioned(
            bottom: 10,
            child: ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                child: Container(
                  width: MediaQuery.of(context).size.width - 40,
                  height: 70,
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: const BorderRadius.all(Radius.circular(15)),
                    border: Border.fromBorderSide(
                      BorderSide(
                        color: imageColor,
                        width: 2,
                      ),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.home_outlined,
                        color: kPrimaryColor,
                        size: 30,
                      ),
                      Image.asset(
                        "assets/icon/four-dots.png",
                        color: imageColor,
                        height: 25,
                      ),
                      Stack(
                        children: [
                          Image.asset(
                            "assets/icon/bell.png",
                            color: imageColor,
                            height: 25,
                          ),
                          Container(
                            height: 12,
                            width: 12,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: kPrimaryColor,
                            ),
                            child: const Text(
                              "2",
                              style: TextStyle(
                                fontSize: 9,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
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
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

//To remove Scroll glow effect
class CustomScroll extends ScrollBehavior {
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
