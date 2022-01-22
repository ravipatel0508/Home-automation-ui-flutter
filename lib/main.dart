import 'dart:ui';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  final Color _color = const Color(0xFFd8AA38);

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
            // Container(
            //   width: 40,
            //   decoration: BoxDecoration(
            //     border: Border.all(
            //       color: Colors.grey,
            //       width: 1,
            //     ),
            //     borderRadius: BorderRadius.circular(20),
            //   ),
            //   child: IconButton(
            //     onPressed: () {},
            //     icon: const Icon(
            //       Icons.add,
            //     ),
            //   ),
            // ),
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
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
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
                                      "16°C NewYork",
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
                              _widget("Living room"),
                              const SizedBox(width: 10),
                              _widget("Kitchen"),
                              const SizedBox(width: 10),
                              _widget("Bedroom"),
                              const SizedBox(width: 10),
                              _widget("Bathroom"),
                              const SizedBox(width: 10),
                              _widget("Office"),
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
                    delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                        return _gridTile();
                      },
                      childCount: 10,
                    ),
                    gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200.0,
                      mainAxisSpacing: 10.0,
                      crossAxisSpacing: 10.0,
                      childAspectRatio: 170 / 100,
                    ),
                  )
              ],
            ),
            Positioned(
              bottom: 10,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  CustomPaint(
                    size: Size(MediaQuery.of(context).size.width, 100),
                    painter: RPSCustomPainter(),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width - 100,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
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

  Widget _gridTile() {
    return Container(
      height: 100,
      width: 170,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: RadialGradient(
            center: Alignment.topLeft,
            radius: 1.3,
            transform: const GradientRotation(0.6),
            colors: [
              _color,
              const Color(0xFF141110),
            ],
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              colors: [Color(0xFF121212), Colors.black],
            ),
            // color: Colors.black,
          ),
          margin: const EdgeInsets.all(1.5),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: GridTile(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Gate 2",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                  const Text(
                    "Unlocked",
                    style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Icon(
                        Icons.lock,
                        color: Colors.white,
                        size: 30,
                      ),
                      const SizedBox(width: 5),
                      Image.asset(
                        "assets/icon/swipe.png",
                        height: 30,
                        width: 30,
                      ),
                      const SizedBox(width: 5),
                      Draggable(
                        axis: Axis.horizontal,
                        maxSimultaneousDrags: 3,
                        rootOverlay: false,
                        child: Container(
                          padding: const EdgeInsets.all(5),
                          decoration: const BoxDecoration(
                            color: Colors.white12,
                            borderRadius: BorderRadius.all(
                              Radius.circular(100),
                            ),
                          ),
                          child: Icon(
                            Icons.lock_open,
                            color: _color,
                            size: 30,
                          ),
                        ),
                        feedback: Container(
                          decoration: const BoxDecoration(
                            color: Colors.white12,
                            borderRadius: BorderRadius.all(
                              Radius.circular(100),
                            ),
                          ),
                          child: const Icon(
                            Icons.lock_open,
                            color: Colors.transparent,
                            size: 40,
                          ),
                        ),
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

  Widget _widget(String title) {
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

class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint0 = Paint()
      ..color = const Color.fromARGB(128, 255, 255, 255)
      ..style = PaintingStyle.fill
      ..maskFilter = const MaskFilter.blur(BlurStyle.inner, 5)
      ..strokeWidth = 1.5;

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
