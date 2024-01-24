import 'package:diabetes_app/core/dimensions.dart';
import 'package:diabetes_app/core/responsive_text.dart';
import 'package:diabetes_app/core/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ActivityBlock extends ConsumerStatefulWidget {
  final String activityName;
  final String value;
  final String subvalue;
  const ActivityBlock(
      {super.key,
      required this.activityName,
      required this.value,
      required this.subvalue});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ActivityBlockState();
}

class _ActivityBlockState extends ConsumerState<ActivityBlock> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      onTap: () {},
      child: Container(
        height: MediaQuery.of(context).size.height / hei(context, 80),
        width: 170,
        decoration: BoxDecoration(
            color: secondaryColor, borderRadius: BorderRadius.circular(20)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ResponsiveText(
                  text: widget.activityName,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15.5,
                      fontFamily: "poppins"),
                ),
                Row(
                  children: [
                    ResponsiveText(
                      text: widget.value,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                          fontFamily: "poppins"),
                    ),
                    const SizedBox(
                      width: 7.5,
                    ),
                    ResponsiveText(
                      text: widget.subvalue,
                      style: const TextStyle(
                          color: Colors.white60,
                          fontSize: 13,
                          fontFamily: "poppins"),
                    ),
                  ],
                )
              ],
            ),
            Image.asset(
              widget.activityName == "Glucose"
                  ? "assets/images/droplets.png"
                  : widget.activityName == "Activity"
                      ? "assets/images/activity.png"
                      : widget.activityName == "Pills"
                          ? "assets/images/pill.png"
                          : "assets/images/apple.png",
              height: 30,
              width: 30,
            )
          ],
        ),
      ),
    );
  }
}
