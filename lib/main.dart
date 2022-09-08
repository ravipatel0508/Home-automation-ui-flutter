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
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<bool> isLocked = [
    true,
    false,
  ];
  MyConst consts = MyConst();

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
                  children: [
                    Positioned(
                      right: -10,
                      child: Container(
                        height: 10,
                        width: 10,
                        decoration: BoxDecoration(
                          color: MyConst().primaryColor,
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
                                style: TextStyle(color: Colors.white, fontSize: 35, fontWeight: FontWeight.w800),
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
                    SizedBox(
                      height: 33,
                      child: ListView.builder(
                        padding: const EdgeInsets.only(left: 20),
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: consts.room.length,
                        itemBuilder: (context, index) => RoomTabs(
                          title: consts.room[index],
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
                          ? lockGridTile(
                              consts.elecricApplianceState[index],
                              index,
                              consts.electicApplianceTitle[index],
                            )
                          : ElectricApplianceGridTile(
                              image: consts.electicApplianceImages[index],
                              titleText: consts.electicApplianceTitle[index],
                              afterTitleText: consts.afterTitleText[index],
                              subtitle: consts.afterSubtitleText[index],
                              afterSubtitleText: consts.electricApplianceSubtitle[index],
                              footerImage: consts.gridFooter[index],
                              isLocked: consts.elecricApplianceState[index],
                              index: index,
                            );
                    },
                    childCount: consts.electicApplianceImages.length,
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
                filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  width: MediaQuery.of(context).size.width - 40,
                  height: 80,
                  decoration: BoxDecoration(
                    color: Colors.white10.withOpacity(0.1),
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Icons.home_outlined,
                        color: consts.primaryColor,
                        size: 30,
                      ),
                      Image.asset(
                        "assets/icon/four-dots.png",
                        color: Colors.white,
                        height: 25,
                      ),
                      Image.asset(
                        "assets/icon/bell.png",
                        color: Colors.white,
                        height: 25,
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

  Widget lockGridTile(bool isLocked, int index, String title) {
    return SizedBox(
      height: 115,
      width: 180,
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: isLocked ? const Color(0xFF252525) : null,
          gradient: isLocked
              ? null
              : RadialGradient(
                  center: Alignment.topLeft,
                  radius: 1.3,
                  transform: const GradientRotation(0.6),
                  colors: [
                    consts.primaryColor,
                    const Color(0xFF141110),
                  ],
                ),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            gradient: isLocked
                ? null
                : const LinearGradient(
                    begin: Alignment.topLeft,
                    colors: [
                      Color(0xFF121212),
                      Colors.black,
                    ],
                  ),
            color: Colors.black,
          ),
          margin: const EdgeInsets.all(1.5),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(12, 12, 10, 0),
            child: GridTile(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.white),
                  ),
                  const SizedBox(height: 3),
                  const Text(
                    "Unlocked",
                    style: TextStyle(fontSize: 10, fontWeight: FontWeight.w500, color: Colors.grey),
                  ),
                  const SizedBox(height: 7),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      isLocked
                          ? Draggable(
                              axis: Axis.horizontal,
                              hitTestBehavior: HitTestBehavior.translucent,
                              onDragEnd: (details) {
                                setState(() {
                                  consts.elecricApplianceState[index] = !consts.elecricApplianceState[index];
                                });
                              },
                              child: Container(
                                padding: const EdgeInsets.all(7),
                                decoration: const BoxDecoration(
                                  color: Color(0xFF252525),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(100),
                                  ),
                                ),
                                child: Image.asset(
                                  "assets/icon/lock.png",
                                  color: Colors.white,
                                  height: 30,
                                ),
                              ),
                              affinity: Axis.horizontal,
                              feedback: Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  color: const Color(0xFF252525).withAlpha(150),
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(100),
                                  ),
                                ),
                              ),
                            )
                          : Image.asset(
                              "assets/icon/lock.png",
                              color: Colors.white,
                              height: 30,
                            ),
                      const SizedBox(width: 6),
                      isLocked
                          ? RotatedBox(
                              quarterTurns: 2,
                              child: Image.asset(
                                "assets/icon/swipe.png",
                                height: 30,
                                width: 30,
                              ),
                            )
                          : Image.asset(
                              "assets/icon/swipe.png",
                              height: 30,
                              width: 30,
                            ),
                      const SizedBox(width: 6),
                      isLocked
                          ? Image.asset(
                              "assets/icon/unlock.png",
                              color: Colors.white,
                              height: 30,
                            )
                          : Draggable(
                              onDragEnd: (details) {
                                setState(() {
                                  consts.elecricApplianceState[index] = !consts.elecricApplianceState[index];
                                });
                              },
                              axis: Axis.horizontal,
                              child: Container(
                                padding: const EdgeInsets.all(7),
                                decoration: const BoxDecoration(
                                  color: Color(0xFF252525),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(100),
                                  ),
                                ),
                                child: Image.asset(
                                  "assets/icon/unlock.png",
                                  color: consts.primaryColor,
                                  height: 30,
                                ),
                              ),
                              feedback: Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  color: const Color(0xFF252525).withAlpha(150),
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(100),
                                  ),
                                ),
                              ),
                            )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

//To remove Scroll glow effect
class CustomScroll extends ScrollBehavior {
  @override
  Widget buildViewportChrome(BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}
