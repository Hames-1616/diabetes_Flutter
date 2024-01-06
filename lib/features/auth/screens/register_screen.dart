import 'package:diabetes_app/core/custom_textfield.dart';
import 'package:diabetes_app/core/dimensions.dart';
import 'package:diabetes_app/core/navigation_page.dart';
import 'package:diabetes_app/core/responsive_text.dart';
import 'package:diabetes_app/core/themes.dart';
import 'package:diabetes_app/features/auth/controller/authRepoController.dart';
import 'package:diabetes_app/features/auth/models/createUser_model.dart';
import 'package:diabetes_app/features/auth/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RegisterScreen extends ConsumerStatefulWidget {
  const RegisterScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends ConsumerState<RegisterScreen> {
  final regkey = GlobalKey<FormState>(debugLabel: "registerkey");
  final email = TextEditingController();
  final username = TextEditingController();
  final password = TextEditingController();
  final conf = TextEditingController();
  String pass = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: secondaryColor,
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: primaryColor,
          scrolledUnderElevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
            splashRadius: 0.1,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Form(
          key: regkey,
          child: SingleChildScrollView(
            reverse: true,
            child: Column(
              children: [
                Stack(children: [
                  Container(
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height /
                          hei(context, 100),
                      color: secondaryColor),
                  Container(
                    padding: const EdgeInsets.only(bottom: 25),
                    width: MediaQuery.of(context).size.width,
                    height:
                        MediaQuery.of(context).size.height / hei(context, 100),
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
                      height: MediaQuery.of(context).size.height /
                          hei(context, 250),
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
                          text: "Register",
                          style: const TextStyle(
                              fontFamily: "poppins", fontSize: 30),
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height /
                                hei(context, 55)),
                        CustomTextField(
                            hintText: "Username",
                            icon: Icons.person_rounded,
                            onChanged: (value) {},
                            con: username),
                        CustomTextField(
                            hintText: "Email",
                            icon: Icons.mail_rounded,
                            onChanged: (value) {},
                            con: email),
                        CustomTextField(
                            obscureText: true,
                            hintText: "Password",
                            icon: Icons.password_rounded,
                            onChanged: (value) {
                              setState(() {
                                pass = value;
                              });
                            },
                            con: password),
                        CustomTextField(
                            conf: pass,
                            obscureText: true,
                            hintText: "Confirm Password",
                            icon: Icons.password_rounded,
                            onChanged: (value) {},
                            con: conf)
                      ],
                    ),
                  ),
                ]),
                InkWell(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    if (regkey.currentState!.validate()) {
                      FocusManager.instance.primaryFocus?.unfocus();
                      final result = await ref
                          .watch(authRepoControllerProvider.notifier)
                          .createAccount(
                              CreateUser(
                                  username: username.text,
                                  email: email.text,
                                  password: password.text),
                              context);
                      if (result) {
                        // ignore: use_build_context_synchronously
                        Navigator.pushReplacement(context, createRoute(const LoginScreen()));
                      }
                    }
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height:
                        MediaQuery.of(context).size.height / hei(context, 50),
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.only(right: 20, left: 20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: primaryColor),
                    child: ref.watch(authRepoControllerProvider)? SizedBox(
                      height: MediaQuery.of(context).size.height/hei(context, 20),
                      width: MediaQuery.of(context).size.width/wid(context, 20),
                      child: const CircularProgressIndicator()):
                    ResponsiveText(
                      textAlign: TextAlign.center,
                      text: "Register",
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
                SizedBox(height: MediaQuery.of(context).viewInsets.bottom)
              ],
            ),
          ),
        ));
  }
}
