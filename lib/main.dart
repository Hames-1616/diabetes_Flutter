import 'package:diabetes_app/core/providers.dart';
import 'package:diabetes_app/core/themes.dart';
import 'package:diabetes_app/features/auth/controller/authRepoController.dart';
import 'package:diabetes_app/features/auth/screens/Info_Intake.dart';
import 'package:diabetes_app/features/auth/screens/login_screen.dart';
import 'package:diabetes_app/features/home/screens/mainPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  @override
  void initState() {
    super.initState();
    ref.read(authRepoControllerProvider.notifier).checktoken();
    ref.read(authRepoControllerProvider.notifier).checkBasicToken();
  }

  @override
  Widget build(BuildContext context) {
    final login = ref.watch(loginscreen);
    final basicInfo = ref.watch(basicInfoPassed);
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarBrightness: Brightness.dark,
    ));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: darkmode,
      home: login ? basicInfo ? const Home() : const PreferencesInfo() : const LoginScreen()
    );
  }
}
