import 'package:flutter/material.dart';
import 'package:fossil_mobile/common/button.dart';
import 'package:fossil_mobile/common/label.dart';
import 'package:fossil_mobile/common/text_field.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
                text: "Forget Password",
                fontSize: 30,
              ),
            ),
            Label(text: "Enter your email address to receive a code"),
            Padding(
              padding: const EdgeInsets.only(left: 18.0, right: 18, top: 20),
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
              padding: const EdgeInsets.only(top: 18.0),
              child: CustomButton(
                  onPress: () {},
                  buttonText: "Send",
                  borderRadius: BorderRadius.circular(8),
                  color: Color(0xfff1963b),
                  color_1: Color(0xfff1963b)),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Label(text: "Don't have an account? Create one"),
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
