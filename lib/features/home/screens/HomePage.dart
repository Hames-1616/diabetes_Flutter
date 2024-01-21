import 'package:diabetes_app/core/dimensions.dart';
import 'package:diabetes_app/core/responsive_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: MediaQuery.of(context).size.height / hei(context, 200),
        actions: [
          Container(
            padding: const EdgeInsets.all(20),
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    ResponsiveText(
                        text: "Hi Haamid!",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: "poppins",
                          fontSize: 28,
                        )),
                    ResponsiveText(
                        text: "${DateFormat('EEEE').format(DateTime.now())}",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: "poppins",
                          fontSize: 28,
                        )),
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
      body: Center(
        child: Text("data"),
      ),
    );
  }
}
