

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:home_automation_ui/constants.dart';

class RoomTabs extends StatefulWidget {
  final String title;
   bool isActive;
  final int index;

   RoomTabs({
    Key? key,
    required this.title,
    required this.isActive,
    required this.index,
  }) : super(key: key);

  @override
  State<RoomTabs> createState() => _RoomTabsState();
}

class _RoomTabsState extends State<RoomTabs> {
  MyConst cons = MyConst();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          cons.roomState[cons.previousIndex] = false;
          cons.roomState[widget.index] = !cons.roomState[widget.index];
          cons.previousIndex = widget.index;
        });
        log(cons.roomState[widget.index].toString());
      },
      child: Container(
        width: 105,
        height: 33,
        margin: const EdgeInsets.only(right: 10),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border.all(
            color: widget.isActive ? cons.primaryColor : cons.secondaryColor,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Text(
          widget.title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 13,
          ),
        ),
      ),
    );
  }
}
