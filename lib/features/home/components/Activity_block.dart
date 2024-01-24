import 'package:diabetes_app/core/dimensions.dart';
import 'package:diabetes_app/core/responsive_text.dart';
import 'package:diabetes_app/core/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ActivityBlock extends ConsumerStatefulWidget {
  const ActivityBlock({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ActivityBlockState();
}

class _ActivityBlockState extends ConsumerState<ActivityBlock> {

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){},
      child: Container(
        height: MediaQuery.of(context).size.height / hei(context, 80),
        width: 170,
        decoration: BoxDecoration(
          color: secondaryColor,
          borderRadius: BorderRadius.circular(20)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ResponsiveText(
                  text: "Glucose",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15.5,
                    fontFamily: "poppins"),
                ),
      
                Row(
                  children: [
                    ResponsiveText(
                      text: "136 ",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                        fontFamily: "poppins"),
                    ),
                    ResponsiveText(
                      text: "mg/dl ",
                      style: const TextStyle(
                        color: Colors.white60,
                        fontSize: 13,
                        fontFamily: "poppins"),
                    ),
                  ],
                )
              ],
            ),
            Container()
          ],
        ),
      ),
    );
  }
}