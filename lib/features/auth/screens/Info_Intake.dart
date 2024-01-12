import 'package:chips_choice/chips_choice.dart';
import 'package:diabetes_app/core/dimensions.dart';
import 'package:diabetes_app/core/responsive_text.dart';
import 'package:diabetes_app/core/themes.dart';
import 'package:diabetes_app/features/auth/controller/authRepoController.dart';
import 'package:diabetes_app/features/auth/models/basicInfo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PreferencesInfo extends ConsumerStatefulWidget {
  const PreferencesInfo({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _PreferencesInfoState();
}

class _PreferencesInfoState extends ConsumerState<PreferencesInfo> {
  int gender = 0;
  int type = 0;
  int blood = 0;
  List<String> values = ["Male", "Type 1", "A"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Container(
                  alignment: Alignment.center,
                  child: ResponsiveText(
                    text: "Basic Information",
                    style: const TextStyle(
                        fontFamily: "poppins",
                        fontWeight: FontWeight.bold,
                        fontSize: 24),
                  )),
              Container(
                  margin: const EdgeInsets.only(right: 10, left: 10, top: 7),
                  alignment: Alignment.center,
                  child: ResponsiveText(
                    textAlign: TextAlign.center,
                    text:
                        "Select Appropriate Information about yourself like your Gender, Diabetes Type and Blood Group",
                    style: const TextStyle(
                        color: Colors.white38,
                        fontFamily: "poppins",
                        fontSize: 15),
                  )),
            ],
          ),
          ChipsChoice<int>.single(
            value: gender,
            onChanged: (val) => setState(() => gender = val),
            choiceItems: C2Choice.listFrom<int, String>(
              source: ["Male", "Female"],
              value: (i, v) => i,
              label: (i, v) => v,
            ),
            choiceBuilder: (item, i) {
              return AnimatedContainer(
                duration: const Duration(milliseconds: 450),
                height: MediaQuery.of(context).size.height / hei(context, 160),
                width: MediaQuery.of(context).size.width / wid(context, 120),
                margin: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                    color: item.selected ? accentColor : secondaryColor,
                    borderRadius: BorderRadius.circular(25)),
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () {
                    setState(() {
                      item.select!(!item.selected);
                      values[0] = item.label;
                    });
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          margin: const EdgeInsets.all(20),
                          child: item.label == "Male"
                              ? Image.asset(
                                  "assets/images/male.png",
                                  color: Colors.white,
                                )
                              : Image.asset(
                                  "assets/images/female.png",
                                  color: Colors.white,
                                )),
                      ResponsiveText(
                        text: item.label,
                        style: const TextStyle(fontFamily: "poppins"),
                      )
                    ],
                  ),
                ),
              );
            },
          ),
          ChipsChoice<int>.single(
            value: type,
            onChanged: (val) => setState(() => type = val),
            choiceItems: C2Choice.listFrom<int, String>(
              source: ["Type 1", "Type 2"],
              value: (i, v) => i,
              label: (i, v) => v,
            ),
            choiceBuilder: (item, i) {
              return AnimatedContainer(
                duration: const Duration(milliseconds: 450),
                height: MediaQuery.of(context).size.height / hei(context, 160),
                width: MediaQuery.of(context).size.width / wid(context, 120),
                margin: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                    color: item.selected ? accentColor : secondaryColor,
                    borderRadius: BorderRadius.circular(25)),
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () {
                    setState(() {
                      item.select!(!item.selected);
                      values[1] = item.label;
                    });
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          margin: const EdgeInsets.all(20),
                          child: item.label == "Type 1"
                              ? Image.asset(
                                  "assets/images/type1.png",
                                  color: Colors.white,
                                )
                              : Image.asset(
                                  "assets/images/type2.png",
                                  color: Colors.white,
                                )),
                      ResponsiveText(
                        text: item.label,
                        style: const TextStyle(fontFamily: "poppins"),
                      )
                    ],
                  ),
                ),
              );
            },
          ),
          ChipsChoice<int>.single(
            value: blood,
            onChanged: (val) => setState(() => blood = val),
            choiceItems: C2Choice.listFrom<int, String>(
              source: ["A", "B", "AB", "O"],
              value: (i, v) => i,
              label: (i, v) => v,
            ),
            choiceBuilder: (item, i) {
              return AnimatedContainer(
                duration: const Duration(milliseconds: 450),
                height: MediaQuery.of(context).size.height / hei(context, 80),
                width: MediaQuery.of(context).size.width / wid(context, 75),
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: item.selected ? accentColor : secondaryColor,
                    borderRadius: BorderRadius.circular(25)),
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () {
                    setState(() {
                      item.select!(!item.selected);
                      values[2] = item.label;
                    });
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          margin: const EdgeInsets.all(15),
                          child: item.label == "A"
                              ? Image.asset(
                                  "assets/images/a.png",
                                  color: Colors.white,
                                )
                              : item.label == "B"
                                  ? Image.asset(
                                      "assets/images/b.png",
                                      color: Colors.white,
                                    )
                                  : item.label == "AB"
                                      ? Image.asset(
                                          "assets/images/ab.png",
                                          color: Colors.white,
                                        )
                                      : Image.asset(
                                          "assets/images/o.png",
                                          color: Colors.white,
                                        )),
                    ],
                  ),
                ),
              );
            },
          ),
          Container(
            alignment: Alignment.center,
            height: MediaQuery.of(context).size.height / hei(context, 50),
            width: MediaQuery.of(context).size.width,
            margin:
                const EdgeInsets.only(right: 40, left: 40, top: 20, bottom: 40),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50), color: accentColor),
            child: InkWell(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              focusColor: Colors.transparent,
              onTap: () {
                ref
                    .watch(authRepoControllerProvider.notifier)
                    .setBasicInfo(BasicInfo(gender: values[0], variant: values[1], blood: values[2]), context);
              },
              child: ref.watch(authRepoControllerProvider)
                  ? SizedBox(
                      height:
                          MediaQuery.of(context).size.height / hei(context, 20),
                      width:
                          MediaQuery.of(context).size.width / wid(context, 20),
                      child: const CircularProgressIndicator(
                        color: Colors.white,
                      ))
                  : ResponsiveText(
                      textAlign: TextAlign.center,
                      text: "Proceed",
                      style: const TextStyle(
                          fontFamily: "poppins",
                          fontSize: 15,
                          color: Colors.white),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
