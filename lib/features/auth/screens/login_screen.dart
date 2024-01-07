import 'package:diabetes_app/core/custom_textfield.dart';
import 'package:diabetes_app/core/dimensions.dart';
import 'package:diabetes_app/core/navigation_page.dart';
import 'package:diabetes_app/core/responsive_text.dart';
import 'package:diabetes_app/core/themes.dart';
import 'package:diabetes_app/features/auth/controller/authRepoController.dart';
import 'package:diabetes_app/features/auth/screens/HomePage.dart';
import 'package:diabetes_app/features/auth/screens/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final email = TextEditingController();
  final password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: secondaryColor,
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: primaryColor,
          toolbarHeight: 0,
          scrolledUnderElevation: 0,
        ),
        body: SingleChildScrollView(
          reverse: true,
          child: Column(
            children: [
              Stack(children: [
                Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width,
                    height:
                        MediaQuery.of(context).size.height / hei(context, 250),
                    color: secondaryColor),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height:
                      MediaQuery.of(context).size.height / hei(context, 250),
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        bottomRight: Radius.circular(100),
                      ),
                      color: primaryColor),
                  child: Hero(
                    tag: "img",
                    child: Image.asset(
                      "assets/images/heartbeat.png",
                      color: Colors.white,
                    ),
                  ),
                ),
              ]),
              Stack(children: [
                Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width,
                    height:
                        MediaQuery.of(context).size.height / hei(context, 250),
                    color: primaryColor),
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(100),
                      ),
                      color: secondaryColor),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                          height: MediaQuery.of(context).size.height /
                              hei(context, 60)),
                      ResponsiveText(
                        text: "Login",
                        style: const TextStyle(
                            fontFamily: "poppins", fontSize: 30),
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height /
                              hei(context, 55)),
                      CustomTextField(
                          hintText: "Email",
                          icon: Icons.mail_rounded,
                          onChanged: (value) {},
                          con: email),
                      CustomTextField(
                          obscureText: true,
                          hintText: "Password",
                          icon: Icons.password_rounded,
                          onChanged: (value) {},
                          con: password)
                    ],
                  ),
                ),
              ]),
              InkWell(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  FocusManager.instance.primaryFocus?.unfocus();
                  var s = await ref
                      .watch(authRepoControllerProvider.notifier)
                      .loginaccount(email.text, password.text, context);
                  if (s) {
                    // ignore: use_build_context_synchronously
                    Navigator.pushReplacement(context, createRoute(const HomePage()));
                  }
                },
                child: Container(
                  alignment: Alignment.center,
                  height: MediaQuery.of(context).size.height / hei(context, 50),
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.only(right: 20, left: 20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: primaryColor),
                  child:ref.watch(authRepoControllerProvider)? SizedBox(
                      height: MediaQuery.of(context).size.height/hei(context, 20),
                      width: MediaQuery.of(context).size.width/wid(context, 20),
                      child: const CircularProgressIndicator()): 
                  ResponsiveText(
                    textAlign: TextAlign.center,
                    text: "Login",
                    style: const TextStyle(
                        fontFamily: "poppins",
                        fontSize: 15,
                        color: Colors.white),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / hei(context, 10),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ResponsiveText(
                    text: "Don't have an Account ? ",
                    style: const TextStyle(fontFamily: "poppins", fontSize: 12),
                  ),
                  InkWell(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () {
                      Navigator.push(
                          context, createRoute(const RegisterScreen()));
                    },
                    child: ResponsiveText(
                      textAlign: TextAlign.center,
                      text: " Register",
                      style: const TextStyle(
                          fontFamily: "poppins",
                          fontSize: 12,
                          color: Color.fromARGB(255, 197, 197, 197)),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / hei(context, 10),
              ),
              SizedBox(height: MediaQuery.of(context).viewInsets.bottom)
            ],
          ),
        ));
  }
}
