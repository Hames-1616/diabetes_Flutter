import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:diabetes_app/core/navigation_page.dart';
import 'package:diabetes_app/core/providers.dart';
import 'package:diabetes_app/features/auth/models/createUser_model.dart';
import 'package:diabetes_app/features/auth/repos/auth_repo.dart';
import 'package:diabetes_app/features/auth/screens/Info_Intake.dart';
import 'package:diabetes_app/features/auth/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final authRepoControllerProvider =
    StateNotifierProvider<AuthRepoController, bool>(
        (ref) => AuthRepoController(crepo: ref.watch(authRepoProvider),cref: ref));

class AuthRepoController extends StateNotifier<bool> {
  final AuthRepo authrepo;
  final StateNotifierProviderRef ref;
  AuthRepoController({required AuthRepo crepo,required StateNotifierProviderRef cref})
      : authrepo = crepo,
        ref = cref,
        super(false);

  void createAccount(CreateUser user, BuildContext context) async {
    state = true;
    final result = await authrepo.createUser(user);
    state = false;
     result.fold((l) {
      AnimatedSnackBar.material(l.message,
              type: AnimatedSnackBarType.warning,
              animationDuration: const Duration(milliseconds: 500),
              mobilePositionSettings:
                  const MobilePositionSettings(topOnAppearance: 100))
          .show(context);
      
    }, (r) =>  Navigator.pushReplacement(context, createRoute(const LoginScreen())));
  }

  void loginaccount(
      String email, String password, BuildContext context) async {
    state = true;
    final s = await authrepo.loginUser(email, password);
    state = false;
    s.fold((l) {
      AnimatedSnackBar.material(l.message,
              type: AnimatedSnackBarType.warning,
              animationDuration: const Duration(milliseconds: 500),
              mobilePositionSettings:
                  const MobilePositionSettings(topOnAppearance: 100))
          .show(context);
      
    }, (r) {
      Navigator.pushReplacement(context, createRoute(const PreferencesInfo()));
    });
  }

  void checktoken() async {
    final remember = await SharedPreferences.getInstance();
    final s = remember.getString("token");
    if (s != null) {
      ref.watch(loginscreen.notifier).state = true;
    } else {
      ref.watch(loginscreen.notifier).state = false;
    }
  }
}
