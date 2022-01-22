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
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);

  final Color _color = const Color(0xFFd8AA38);
  final List<String> _electicApplianceImages = [
    "assets/icons/hang-lamp.png",
    "assets/icons/hang-lamp.png",
    "assets/icons/coffee-machine.png",
    "assets/icons/ac.png",
    "assets/icons/monitor.png",
    "assets/icons/chandelier.png",
  ];
  final List<String> _electicApplianceTitle = [
    "Studio Lamp",
    "Door Light",
    "Coffee Machine",
    "A.C.",
    "LR TV",
    "Chandelier",
  ];
  final List<String> _afterTitleText = [
    "",
    "",
    "",
    "23°",
    "",
    "",
  ];
  final List<String> _afterSubtitleText = [
    "",
    "",
    "",
    "05:25 · Latte",
    "",
    "",
  ];
  final List<String> _electricApplianceSubtitle = [
    "Philips Hue",
    "Amazon 1",
    "Phillips Smart Brew",
    "LG Smart",
    "Smasung QLED",
    ""
  ];
  final List<String> _gridFooter = [
    "assets/icons/dot.png",
    "assets/icons/wall-clock.png",
    "assets/icons/wall-clock.png",
    "assets/icons/left-arrow.png",
    "assets/icons/transperant-image.png",
    "assets/icons/wall-clock.png",
  ];
  final List<bool> _isActive = [
    true,
    false,
    true,
    true,
    false,
    false,
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          primary: true,
          title: const Text(
            "tempest",
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.italic,
            ),
          ),
          actions: [
            Image.asset(
              "assets/icon/add.png",
              color: Colors.white,
              height: 25,
            ),
          ],
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          shadowColor: Colors.transparent,
        ),
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
              slivers: [
                const SliverToBoxAdapter(
                  child: SizedBox(height: 90),
                ),
                SliverToBoxAdapter(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                                SizedBox(),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                      color: _color,
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
                              _area("Living room", true),
                              const SizedBox(width: 10),
                              _area("Kitchen", true),
                              const SizedBox(width: 10),
                              _area("Bedroom", true),
                              const SizedBox(width: 10),
                              _area("Bathroom", true),
                              const SizedBox(width: 10),
                              _area("Office", true),
                              const SizedBox(width: 10),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                    ],
                  ),
                ),
                SliverGrid(
                  delegate: SliverChildListDelegate.fixed([
                    _gridTile("Gate 2", false),
                  ]),
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200.0,
                    mainAxisSpacing: 10.0,
                    crossAxisSpacing: 5.9,
                    childAspectRatio: 175 / 96,
                  ),
                )
              ],
            ),
            // Positioned(
            //   bottom: 15,
            //   left: 15,
            //   right: 15,
            //   top: MediaQuery.of(context).size.height * 0.8,
            //   child: BackdropFilter(
            //     filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
            //     child: CustomPaint(
            //       size: Size(MediaQuery.of(context).size.width, 100),
            //       painter: MyCustomPainter(),
            //     ),
            //     // blendMode: BlendMode.xor,
            //   ),
            // ),

            Positioned(
              bottom: 10,
              child: Stack(
                // clipBehavior: Clip.antiAlias,
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
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.home_outlined,
                            color: _color,
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.home_outlined,
                            color: Colors.white,
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.home_outlined,
                            color: Colors.white,
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.home_outlined,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _electricAppliances(String title, bool isLocked) {
    return SizedBox(
      height: 111,
      width: 180,
      child: DecoratedBox(
        decoration:
            //Radial gradient for activated tile
            BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: isLocked ? null : Color(0xff2252525),
          gradient: isLocked
              ? RadialGradient(
                  center: Alignment.topLeft,
                  radius: 1.3,
                  transform: const GradientRotation(0.6),
                  colors: [
                    _color,
                    const Color(0xFF141110),
                  ],
                )
              : null,
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: isLocked
                ? const LinearGradient(
                    begin: Alignment.topLeft,
                    colors: [
                      Color(0xFF121212),
                      Colors.black,
                    ],
                  )
                : null,
            color: Colors.black,
          ),
          margin: const EdgeInsets.all(1.5),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(12, 8, 10, 8),
            child: GridTile(
              header: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    height: 10,
                    width: 10,
                    decoration: BoxDecoration(
                      color: _color,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(100),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 2,
                  ),
                  Text(
                    "ON",
                    style: TextStyle(color: _color),
                  )
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    "assets/icon/hang-lamp.png",
                    height: 30,
                    color: Colors.white,
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    "Studio Light",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 16),
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    "Phillips Hue",
                    style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w400,
                        fontSize: 10),
                  ),
                ],
              ),
              footer: const Align(
                  alignment: Alignment.bottomRight,
                  child: Icon(
                    Icons.timer,
                    color: Colors.white,
                  )),
            ),
          ),
        ),
      ),
    );
  }

  Widget _gridTile(String title, bool isLocked) {
    return SizedBox(
      height: 111,
      width: 180,
      child: DecoratedBox(
        decoration:
            //Radial gradient for activated tile
            BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: isLocked ? null : Color(0xff2252525),
          gradient: isLocked
              ? RadialGradient(
                  center: Alignment.topLeft,
                  radius: 1.3,
                  transform: const GradientRotation(0.6),
                  colors: [
                    _color,
                    const Color(0xFF141110),
                  ],
                )
              : null,
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: isLocked
                ? const LinearGradient(
                    begin: Alignment.topLeft,
                    colors: [
                      Color(0xFF121212),
                      Colors.black,
                    ],
                  )
                : null,
            color: Colors.black,
          ),
          margin: const EdgeInsets.all(1.5),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(12, 8, 10, 8),
            child: GridTile(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Gate 2",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                  const SizedBox(height: 2),
                  const Text(
                    "Unlocked",
                    style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey),
                  ),
                  const SizedBox(height: 7),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      isLocked
                          ? Image.asset(
                              "assets/icon/lock.png",
                              color: Colors.white,
                              height: 30,
                            )
                          : Draggable(
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
                                  "assets/icon/lock.png",
                                  color: Colors.white,
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
                            ),
                      const SizedBox(width: 6),
                      isLocked
                          ? Image.asset(
                              "assets/icon/swipe.png",
                              height: 30,
                              width: 30,
                            )
                          : RotatedBox(
                              quarterTurns: 2,
                              child: Image.asset(
                                "assets/icon/swipe.png",
                                height: 30,
                                width: 30,
                              ),
                            ),
                      const SizedBox(width: 6),
                      isLocked
                          ? Draggable(
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
                                  color: _color,
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
                          : Image.asset(
                              "assets/icon/unlock.png",
                              color: Colors.white,
                              height: 30,
                            ),
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

  Widget _area(String title, bool isActive) {
    return Container(
      width: 105,
      height: 33,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border.all(
          color: _color,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 13,
        ),
      ),
    );
  }
}

class MyCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint0 = Paint()
      ..color = const Color.fromARGB(128, 255, 255, 255)
      ..style = PaintingStyle.fill
      ..strokeWidth = 2.0
      ..shader = const LinearGradient(
        colors: [Colors.white, Colors.black],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height))
      // ..strokeCap = StrokeCap.round
      // ..isAntiAlias = true
      // ..blendMode = BlendMode.srcATop
      ..maskFilter = MaskFilter.blur(BlurStyle.normal, 2.0)
      ..filterQuality = FilterQuality.low
      ..colorFilter = ColorFilter.mode(
        Colors.black.withOpacity(0.6),
        BlendMode.srcATop,
      );
    // ..imageFilter = ImageFilter.blur(sigmaX: 3, sigmaY: 3);
    // ..blendMode = BlendMode.xor;

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
