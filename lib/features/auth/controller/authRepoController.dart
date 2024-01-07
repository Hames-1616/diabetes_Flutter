import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:diabetes_app/features/auth/models/createUser_model.dart';
import 'package:diabetes_app/features/auth/repos/auth_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authRepoControllerProvider =
    StateNotifierProvider<AuthRepoController, bool>(
        (ref) => AuthRepoController(crepo: ref.watch(authRepoProvider)));

class AuthRepoController extends StateNotifier<bool> {
  final AuthRepo authrepo;

  AuthRepoController({required AuthRepo crepo})
      : authrepo = crepo,
        super(false);

  Future<bool> createAccount(CreateUser user, BuildContext context) async {
    state = true;
    final result = await authrepo.createUser(user);
    state = false;
    return result.fold((l) {
      AnimatedSnackBar.material(l.message,
              type: AnimatedSnackBarType.warning,
              animationDuration: const Duration(milliseconds: 500),
              mobilePositionSettings:
                  const MobilePositionSettings(topOnAppearance: 100))
          .show(context);
      return false;
    }, (r) => true);
  }

  Future<bool> loginaccount(
      String email, String password, BuildContext context) async {
    state = true;
    final s = await authrepo.loginUser(email, password);
    state = false;
    return s.fold((l) {
      AnimatedSnackBar.material(l.message,
              type: AnimatedSnackBarType.warning,
              animationDuration: const Duration(milliseconds: 500),
              mobilePositionSettings:
                  const MobilePositionSettings(topOnAppearance: 100))
          .show(context);
      return false;
    }, (r) => true);
  }
}
