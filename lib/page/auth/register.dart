// ignore_for_file: prefer_const_constructors, must_be_immutable, use_key_in_widget_constructors

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fossil_mobile/constants/colors.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:fossil_mobile/common/button.dart';
import 'package:fossil_mobile/common/label.dart';
import 'package:fossil_mobile/common/navigator.dart';
import 'package:fossil_mobile/common/text_field.dart';
import 'package:fossil_mobile/controller/auth_controller.dart';
import 'package:fossil_mobile/model/user.dart';
import 'package:fossil_mobile/page/auth/login.dart';
import 'package:fossil_mobile/service/api_service.dart';

final authControllerProvider =
    StateNotifierProvider<AuthController, AsyncValue<User?>>((ref) {
  return AuthController();
});

class Register extends ConsumerWidget {
  Register({Key? key});

  final ApiService apiService = ApiService();
  bool _isObscure = true;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    void navigateToLogin() {
      NavigationUtil.navigateToPage(context, Login());
    }

    final authController = ref.read(authControllerProvider.notifier);
    Future<void> register() async {
      final result = await authController.register(
        usernameController.text,
        emailController.text,
        passwordController.text,
      );
      if (result.user != null) {
        showSimpleNotification(Label(text: "Successfully registered in"),
            background: primaryColor,
            autoDismiss: true,
            duration: Duration(seconds: 3));
        Timer(Duration(seconds: 2), navigateToLogin);
      } else {
        showSimpleNotification(
            Label(text: result.errorMessage ?? 'Unknown error'),
            background: primaryColor,
            autoDismiss: true,
            duration: Duration(seconds: 3));
      }
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: EdgeInsets.only(top: 28, bottom: 20),
                child: Image.asset(
                  "/images/fossil-logo.png",
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Label(
                text: "Sign Up",
                fontSize: 30,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 18.0, right: 18, bottom: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Label(
                      text: "Username",
                      fontName: "Roboto",
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF9796A1)),
                  SizedBox(
                    height: 5,
                  ),
                  CustomInputField(
                    isError: false,
                    labelText: "John Doe",
                    textStyle:
                        TextStyle(color: Color(0xFF000000), fontSize: 18),
                    controller: usernameController,
                    height: 60,
                    width: double.infinity,
                    labelStyle:
                        TextStyle(fontSize: 15, color: Color(0xFF9796A1)),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 18.0, right: 18, bottom: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Label(
                      text: "Email",
                      fontName: "Roboto",
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF9796A1)),
                  SizedBox(
                    height: 5,
                  ),
                  CustomInputField(
                    isError: false,
                    labelText: "joe.doe@email.com",
                    textStyle:
                        TextStyle(color: Color(0xFF000000), fontSize: 18),
                    controller: emailController,
                    height: 60,
                    width: double.infinity,
                    labelStyle:
                        TextStyle(fontSize: 15, color: Color(0xFF9796A1)),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 18.0, right: 18, top: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Label(
                      text: "Password",
                      fontName: "Roboto",
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF9796A1)),
                  SizedBox(
                    height: 5,
                  ),
                  CustomInputField(
                    isError: false,
                    labelText: "Password here",
                    obscureText: _isObscure,
                    controller: passwordController,
                    textStyle:
                        TextStyle(color: Color(0xFF000000), fontSize: 18),
                    height: 60,
                    width: double.infinity,
                    suffixIcon: GestureDetector(
                      onTap: () {},
                      child: Icon(
                          _isObscure ? Icons.visibility_off : Icons.visibility),
                    ),
                    labelStyle:
                        TextStyle(fontSize: 15, color: Color(0xFF9796A1)),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 18.0),
              child: CustomButton(
                  onPress: () {
                    register();
                  },
                  buttonText: "Register",
                  borderRadius: BorderRadius.circular(8),
                  color: Color(0xfff1963b),
                  color_1: Color(0xfff1963b)),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    NavigationUtil.navigateToPage(context, Login());
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Label(text: "Already have an account? Login"),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
