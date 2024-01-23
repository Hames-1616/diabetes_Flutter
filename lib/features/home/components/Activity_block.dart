import 'package:diabetes_app/core/dimensions.dart';
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
    return Container(
      height: MediaQuery.of(context).size.height / hei(context, 40),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: BorderRadius.circular(20)
      ),
    );
  }
}