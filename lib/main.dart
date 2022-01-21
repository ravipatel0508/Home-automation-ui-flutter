import 'dart:ui';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
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
  Color _color = Color(0xFFd8AA38);

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
            Positioned(
              top: 90,
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
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
                                  fontSize: 20,
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
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold),
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
                                    "16 C New York",
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
                    const SizedBox(
                      height: 40,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Row(
                          children: [
                            _widget("Living room"),
                            const SizedBox(
                              width: 10,
                            ),
                            _widget("Kitchen"),
                            const SizedBox(
                              width: 10,
                            ),
                            _widget("Bedroom"),
                            const SizedBox(
                              width: 10,
                            ),
                            _widget("Bathroom"),
                            const SizedBox(
                              width: 10,
                            ),
                            _widget("Office"),
                            const SizedBox(
                              width: 10,
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),

                    Container(
                      height: 100,
                      width: 170,
                      margin: const EdgeInsets.symmetric(horizontal: 30),
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
                          child: const Center(
                              child: Text(
                            "data",
                            style: TextStyle(color: Colors.white),
                          )),
                        ),
                      ),
                    ),
                    // Container(
                    //   child: SingleChildScrollView(
                    //     child: GridView(
                    //       gridDelegate:
                    //           const SliverGridDelegateWithFixedCrossAxisCount(
                    //               crossAxisCount: 2),
                    //       children: [
                    //         GridTile(
                    //           header: const GridTileBar(
                    //             title: Text(
                    //               "Living room",
                    //               style: TextStyle(
                    //                 color: Colors.white,
                    //                 fontSize: 20,
                    //               ),
                    //             ),
                    //             backgroundColor: Colors.transparent,
                    //           ),
                    //           child: Image.asset(
                    //             "assets/icon/sun.png",
                    //             color: _color,
                    //             height: 200,
                    //           ),
                    //         )
                    //       ],
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 10,
              child: Container(
                child: Stack(
                  children: [
                    CustomPaint(
                      size: Size(MediaQuery.of(context).size.width, 100),
                      painter: RPSCustomPainter(),
                    ),
                  ],
                ),
              ),
            )
          ],
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
    path0.moveTo(size.width * 0.1948100, size.height * 0.1623333);
    path0.cubicTo(
        size.width * 0.0485000,
        size.height * 0.1303333,
        size.width * 0.1380200,
        size.height * 0.8205000,
        size.width * 0.1948100,
        size.height * 0.8350667);
    path0.cubicTo(
        size.width * 0.3215200,
        size.height * 0.8350667,
        size.width * 0.6754900,
        size.height * 0.8384667,
        size.width * 0.8021900,
        size.height * 0.8384667);
    path0.cubicTo(
        size.width * 0.8575100,
        size.height * 0.8238333,
        size.width * 0.9481900,
        size.height * 0.1226333,
        size.width * 0.8031900,
        size.height * 0.1658333);
    path0.cubicTo(
        size.width * 0.6765200,
        size.height * 0.1658333,
        size.width * 0.5751200,
        size.height * 0.1623333,
        size.width * 0.1948100,
        size.height * 0.1623333);
    path0.close();

    canvas.drawPath(path0, paint0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
