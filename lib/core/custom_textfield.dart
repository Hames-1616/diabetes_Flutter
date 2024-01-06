import 'package:diabetes_app/core/dimensions.dart';
import 'package:diabetes_app/core/themes.dart';
import 'package:flutter/material.dart';


class CustomTextField extends StatelessWidget {
  CustomTextField({
    this.conf = "",
    this.a = 50,
    this.keyboard = TextInputType.text,
    required this.hintText,
    required this.icon,
    this.obscureText = false,
    required this.onChanged,
    required this.con,
    Key? key,
  }) : super(key: key);
  final String conf;
  final int a;
  final TextInputType keyboard;
  final String hintText;
  final IconData icon;
  final bool obscureText;
  final Function(String) onChanged;
  final TextEditingController con;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          right: MediaQuery.of(context).size.width / wid(context, 25),
          left: MediaQuery.of(context).size.width / wid(context, 25),
          bottom: MediaQuery.of(context).size.height / hei(context, 15)),
      child: TextFormField(
        // scrollPadding: EdgeInsets.only(
        //   bottom: MediaQuery.of(context).viewInsets.bottom),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "This Field is requried";
          }
          if (hintText == "Confirm Password") {
            if (value != conf) {
              return "Password didn't match";
            }
          }
          if (hintText == "Email") {
            if (!value.contains("@") && !value.contains(".com")) {
              return "Invalid Email";
            }
          }
          if (hintText == "Password") {
            if (value.length < 5) {
              return "Password should contain atleast 5 characters";
            }
          }
          return null;
        },
        maxLength: a,
        keyboardType: keyboard,
        controller: con,
        obscureText: obscureText,
        style: const TextStyle(
          fontFamily: "poppins",
          color: Colors.white,
          fontSize: 15.0,
        ),
        decoration: InputDecoration(
          counterText: "",
          contentPadding: const EdgeInsets.all(18.0),
          filled: true,
          fillColor: secondaryColor,
          prefixIcon: Icon(
            icon,
            size: 24.0,
            color: Colors.white54,
          ),
          hintText: hintText,
          hintStyle: const TextStyle(
            fontFamily: "poppins",
            color: Colors.white54,
            fontSize: 15.0,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18.0),
            borderSide: BorderSide(color:primaryColor),
          ),
          errorStyle: const TextStyle(fontFamily: "poppins"),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18.0),
            borderSide: BorderSide(color: Colors.red.shade100),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18.0),
            borderSide: BorderSide(color: primaryColor),
          ),
        ),
        onChanged: onChanged,
      ),
    );
  }
}