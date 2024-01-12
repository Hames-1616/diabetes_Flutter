import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';

void showSnackbar(BuildContext context,message)
{
  AnimatedSnackBar.material(message,
              type: AnimatedSnackBarType.warning,
              animationDuration: const Duration(milliseconds: 500),
              mobilePositionSettings:
                  const MobilePositionSettings(topOnAppearance: 100))
          .show(context);
}