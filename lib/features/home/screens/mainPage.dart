import 'package:diabetes_app/core/themes.dart';
import 'package:diabetes_app/features/home/screens/HomePage.dart';
import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Home extends ConsumerStatefulWidget {
  const Home({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeState();
}
int _currentIndex = 0;
class _HomeState extends ConsumerState<Home> {
  void changePage(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  final pages = [const HomePage(), Container(),Container()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: pages[_currentIndex],
      bottomNavigationBar: DotNavigationBar(
        itemPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
        backgroundColor: teritaryColor,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.black45,
        marginR: const EdgeInsets.only(left: 20,right: 20),
        paddingR: const EdgeInsets.only(top: 5,bottom: 5,right: 10,left: 10),
        currentIndex: _currentIndex,
        onTap: changePage,
        dotIndicatorColor: Colors.transparent,
        items: [
          /// Home
          DotNavigationBarItem(
              icon: const Icon(Icons.home),
          ),

          /// Likes
          DotNavigationBarItem(
              icon: const Icon(Icons.stacked_bar_chart_sharp),
              ),


          /// Profile
          DotNavigationBarItem(
              icon: const Icon(Icons.person),
           ),
        ],
      ),
    );
  }
}
