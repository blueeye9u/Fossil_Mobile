// ignore_for_file: prefer_const_constructors, use_build_context_synchronously, use_key_in_widget_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fossil_mobile/constants/colors.dart';
import 'package:fossil_mobile/features/auth/provider/auth_provider.dart';
import 'package:fossil_mobile/features/auth/state/auth_state.dart';
import 'package:fossil_mobile/features/auth/widget/register.dart';
import 'package:fossil_mobile/shared/route/app_router.dart';
import 'package:go_router/go_router.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:fossil_mobile/common/button.dart';
import 'package:fossil_mobile/common/label.dart';
import 'package:fossil_mobile/common/navigator.dart';
import 'package:fossil_mobile/common/text_field.dart';

class Login extends ConsumerWidget {
  Login({Key? key});

  final bool _isObscure = true;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void _handleAuthenticationResult(AuthState state, BuildContext context) {
    state.when(
      initial: () {},
      loading: () {
        // Show loading indicator or handle loading state
      },
      loggedIn: () {
        // Authentication successful
        showSimpleNotification(Label(text: "Authentication successful"),
            background: primaryColor,
            autoDismiss: true,
            duration: Duration(seconds: 3));
        context.go(SignInRoute.path);
      },
      loggedOut: () {
        // Handle logged out state
      },
      error: (error) {
        showSimpleNotification(
            Label(text: "Login failed, check your credential and try again"),
            background: const Color.fromARGB(
                255, 247, 130, 122), // or any other color for error
            autoDismiss: true,
            duration: Duration(seconds: 3));
      },
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authNotifierProvider);
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
                  "assets/images/fossil-logo.png",
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Label(
                text: "Sign In",
                fontSize: 30,
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
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {
                    // NavigationUtil.navigateToPage(context, ForgetPassword());
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8, right: 26.0),
                    child: Label(text: "Forgot Password?"),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 18.0),
              child: CustomButton(
                  onPress: () {
                    ref
                        .read(authNotifierProvider.notifier)
                        .login(emailController.text, passwordController.text);
                    _handleAuthenticationResult(authState, context);
                    // showSimpleNotification(Label(text: "//response here"),
                    //     background: primaryColor,
                    //     autoDismiss: true,
                    //     duration: Duration(seconds: 3));
                    // context.go('/');
                    // Timer(Duration(seconds: 2), navigateToHome);
                  },
                  buttonText: "Login",
                  borderRadius: BorderRadius.circular(8),
                  color: Color(0xfff1963b),
                  color_1: Color(0xfff1963b)),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    NavigationUtil.navigateToPage(context, Register());
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Label(text: "Already have an account? Create one"),
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
