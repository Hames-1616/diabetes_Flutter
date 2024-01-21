import 'package:diabetes_app/core/dimensions.dart';
import 'package:diabetes_app/core/responsive_text.dart';
import 'package:diabetes_app/core/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  double eaten = 24;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: primaryColor,
          toolbarHeight: MediaQuery.of(context).size.height / hei(context, 120),
          actions: [
            Container(
              padding: const EdgeInsets.all(20),
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ResponsiveText(
                          text: "Hi Haamid!",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: "poppins",
                            fontSize: 28,
                          )),
                      ResponsiveText(
                          text:
                              "${DateFormat('EEEE').format(DateTime.now())}, ${DateFormat('dd').format(DateTime.now())} ${DateFormat('MMMM').format(DateTime.now())}",
                          style: const TextStyle(
                              fontFamily: "poppins",
                              fontSize: 16,
                              color: Colors.white60)),
                    ],
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.notifications,
                        size: 28,
                      ))
                ],
              ),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height / hei(context, 180),
                margin: const EdgeInsets.only(left: 20, right: 20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: secondaryColor),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.only(left: 45),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ResponsiveText(
                            text: "Eaten",
                            style: const TextStyle(
                                fontFamily: "poppins",
                                fontSize: 22,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Row(
                            children: [
                              ResponsiveText(
                                text: "${eaten.toInt()} GL ",
                                style: TextStyle(
                                    fontFamily: "poppins",
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: greenAccent),
                              ),
                              ResponsiveText(
                                text: "of 64 GL",
                                style: const TextStyle(
                                    fontFamily: "poppins",
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white60),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Chip(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              label: ResponsiveText(
                                text: "${(64 - eaten).toInt()} GL left",
                                style: const TextStyle(fontFamily: "poppins"),
                              ))
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(right: 45),
                      child: CircularPercentIndicator(
                        radius: 65.0,
                        lineWidth: 10.0,
                        backgroundColor: primaryColor,
                        percent: ((eaten * 100) / 64) / 100,
                        progressColor: greenAccent,
                        animation: true,
                        animationDuration: 800,
                        center: ResponsiveText(
                            text: " ${((eaten * 100) / 64).round()}%",
                            style: const TextStyle(fontFamily: "poppins",fontSize: 18,fontWeight: FontWeight.bold),
                            ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
