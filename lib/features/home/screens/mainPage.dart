import 'package:diabetes_app/core/themes.dart';
import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Home extends ConsumerWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int selected = 0;
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: Container(),
        bottomNavigationBar: Container(
          margin: const EdgeInsets.only(bottom: 10),
          child: DotNavigationBar(
            
            itemPadding: EdgeInsets.all(5),
              currentIndex: selected,
              onTap: (p0) {
                selected = p0;
              },
              selectedItemColor: primaryColor,
              items: [
                DotNavigationBarItem(icon: const Icon(Icons.home)),
                DotNavigationBarItem(icon: const Icon(Icons.settings))
              ]),
        ));
  }
}
