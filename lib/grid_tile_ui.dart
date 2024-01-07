import 'package:flutter/material.dart';
import 'package:home_automation_ui/constants.dart';

// ignore: must_be_immutable
class ElectricApplianceGridTile extends StatefulWidget {
  final String image;
  final String titleText;
  final String afterTitleText;
  final String subtitle;
  final String afterSubtitleText;
  final String footerImage;
  bool isLocked;
  final int index;

  ElectricApplianceGridTile({
    Key? key,
    required this.image,
    required this.titleText,
    required this.afterTitleText,
    required this.subtitle,
    required this.afterSubtitleText,
    required this.footerImage,
    required this.isLocked,
    required this.index,
  }) : super(key: key);

  @override
  State<ElectricApplianceGridTile> createState() =>
      _ElectricApplianceGridTileState();
}

class _ElectricApplianceGridTileState extends State<ElectricApplianceGridTile> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          widget.isLocked = !widget.isLocked;
        });
      },
      child: SizedBox(
        height: 115,
        width: 180,
        child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: widget.isLocked ? null : gridTileBorderColor,
            gradient: widget.isLocked
                ? RadialGradient(
                    center: Alignment.topLeft,
                    radius: 1.3,
                    transform: isDark ? const GradientRotation(0.5) : null,
                    colors: [kPrimaryColor, Colors.blueGrey[200]!],
                  )
                : null,
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              gradient: widget.isLocked
                  ? LinearGradient(
                      begin: Alignment.topLeft,
                      colors: gridTileGradient,
                    )
                  : null,
              color: gridTileBGColor,
            ),
            margin: const EdgeInsets.all(1.5),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(12, 10, 10, 8),
              child: GridTile(
                header: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 4),
                      child: Container(
                        height: 8,
                        width: 8,
                        decoration: BoxDecoration(
                          color: widget.isLocked
                              ? kPrimaryColor
                              : onOffStatusColor,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(100)),
                        ),
                      ),
                    ),
                    const SizedBox(width: 3),
                    Padding(
                      padding: const EdgeInsets.only(top: 7),
                      child: Text(
                        widget.isLocked ? "ON" : "OFF",
                        style: TextStyle(
                            color: widget.isLocked
                                ? kPrimaryColor
                                : onOffStatusColor,
                            fontSize: 11),
                      ),
                    )
                  ],
                ),
                footer: Align(
                  alignment: Alignment.bottomRight,
                  child: Image.asset(
                    widget.footerImage,
                    height: 18,
                    color: kElecticApplianceTitle[widget.index] == "Studio Lamp"
                        ? const Color(0xFFA61D98)
                        : Colors.white,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(widget.image, height: 27, color: imageColor),
                    const SizedBox(height: 7),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.titleText,
                          style: TextStyle(
                            color: kTextColor,
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          widget.afterTitleText,
                          style: TextStyle(
                            color: kTextColor,
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Text(
                      widget.subtitle,
                      style: const TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w400,
                        fontSize: 10,
                      ),
                    ),
                    const SizedBox(height: 1),
                    Text(
                      widget.afterSubtitleText,
                      style: TextStyle(
                        color: kTextColor,
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class LockGridTile extends StatefulWidget {
  final String title;
  final bool isLocked;
  final int index;

  const LockGridTile({
    Key? key,
    required this.title,
    required this.isLocked,
    required this.index,
  }) : super(key: key);

  @override
  State<LockGridTile> createState() => _LockGridTileState();
}

class _LockGridTileState extends State<LockGridTile> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 115,
      width: 180,
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: widget.isLocked ? const Color(0xFF252525) : null,
          gradient: widget.isLocked
              ? null
              : RadialGradient(
                  center: Alignment.topLeft,
                  radius: 1.3,
                  transform: isDark ? const GradientRotation(0.6) : null,
                  colors: gridBorderGradient,
                ),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            gradient: widget.isLocked
                ? null
                : LinearGradient(
                    begin: Alignment.topLeft,
                    colors: backgroundGradient,
                  ),
            color: gridTileBGColor,
          ),
          margin: const EdgeInsets.all(1.5),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(12, 12, 10, 0),
            child: GridTile(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.title,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: kTextColor,
                    ),
                  ),
                  const SizedBox(height: 3),
                  const Text(
                    "Unlocked",
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 7),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      widget.isLocked
                          ? Draggable(
                              axis: Axis.horizontal,
                              hitTestBehavior: HitTestBehavior.translucent,
                              onDragEnd: (details) {
                                setState(() {
                                  kElecricApplianceState[widget.index] =
                                      !kElecricApplianceState[widget.index];
                                });
                              },
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
                                  color: imageColor,
                                  height: 30,
                                ),
                              ),
                            )
                          : Image.asset(
                              "assets/icon/lock.png",
                              color:
                                  isDark ? Colors.white : Colors.blueGrey[200],
                              height: 30,
                            ),
                      const SizedBox(width: 6),
                      widget.isLocked
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
                      widget.isLocked
                          ? Image.asset(
                              "assets/icon/unlock.png",
                              color: isDark ? Colors.white : kPrimaryColor,
                              height: 30,
                            )
                          : Draggable(
                              onDragEnd: (details) {
                                setState(() {
                                  kElecricApplianceState[widget.index] =
                                      !kElecricApplianceState[widget.index];
                                });
                              },
                              axis: Axis.horizontal,
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
                                  color: isDark
                                      ? kPrimaryColor
                                      : Colors.blueGrey[200],
                                  height: 30,
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
