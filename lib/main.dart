import 'package:flutter/material.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   primary: true,
      //   title: const Text(
      //         "tempest",
      //         style: TextStyle(
      //           color: Colors.white,
      //           fontSize: 30,
      //           fontWeight: FontWeight.w500,
      //           fontStyle: FontStyle.italic,
      //         ),
      //       ),
      //   actions: [
      //     IconButton(
      //       icon: const Icon(Icons.add),
      //       onPressed: () {},
      //     ),
      //   ],
      //   centerTitle: true,
      //   backgroundColor: Colors.transparent,
      //   // elevation: 0.0,
      //   foregroundColor: Colors.transparent,
      //   shadowColor: Colors.transparent,
      // ),
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
          Container(
            alignment: Alignment.topCenter,
            child: Text(
              "tempest",
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.w500,
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
