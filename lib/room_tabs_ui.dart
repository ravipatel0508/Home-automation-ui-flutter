import 'package:flutter/material.dart';
import 'package:home_automation_ui/constants.dart';

class RoomTabs extends StatefulWidget {
  final String title;
  final int index;

  const RoomTabs({
    Key? key,
    required this.title,
    required this.index,
  }) : super(key: key);

  @override
  State<RoomTabs> createState() => _RoomTabsState();
}

class _RoomTabsState extends State<RoomTabs> {
  List<bool> roomState = [
    true,
    false,
    false,
    false,
    false,
  ];
  var previousIndex = 0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          // roomState[previousIndex] = false;
          roomState[widget.index] = !roomState[widget.index];
          // previousIndex = widget.index;
        });
      },
      child: Container(
        width: 105,
        height: 33,
        margin: const EdgeInsets.only(right: 10),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border.all(
            color: roomState[widget.index] ? MyConst().primaryColor : MyConst().secondaryColor,
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
