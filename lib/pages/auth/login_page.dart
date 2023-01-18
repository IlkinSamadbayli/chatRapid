import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_media/pages/auth/register_page.dart';
import 'package:social_media/styles/styles/custom_text_style.dart';
import 'package:social_media/styles/styles/global_border_style.dart';

import '../../styles/colors/app_colors.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late FocusNode emailFocus;
  late FocusNode passwordFocus;
  final formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';

  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    emailFocus = FocusNode();
    passwordFocus = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    emailFocus.dispose();
    passwordFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Container(
            color: const Color.fromARGB(26, 65, 62, 62),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 60),
              child: Column(
                children: <Widget>[
                  Text(
                    'Login Page',
                    style: CustomTextStyle.largeBoldStyle,
                  ),
                  const SizedBox(height: 50),
                  Image.network(
                    'https://mhealthfairview.org/-/jssmedia/Images/MyChart/Asset-22x.png?hash=CA3540D2F321A07493E1A1FFEC4253D0',
                    width: MediaQuery.of(context).size.width * .6,
                    height: MediaQuery.of(context).size.height * .2,
                  ),
                  const SizedBox(height: 50),
                  TextFormField(
                    onChanged: (value) => setState(() {
                      email = value;
                    }),
                    focusNode: emailFocus,
                    controller: emailController,
                    decoration:
                        GlobalBorderStyle.kInputDecoration("Enter mail"),
                  ),
                  const SizedBox(height: 15),
                  TextFormField(
                      onChanged: (value) => setState(() {
                            password = value;
                          }),
                      focusNode: passwordFocus,
                      controller: passwordController,
                      decoration:
                          GlobalBorderStyle.kInputDecoration("Enter password")),
                  const SizedBox(height: 30),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: AppColor.mainColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24))),
                      onPressed: () {
                        onTap;
                      },
                      child: const Text(
                        "Sign in",
                        style: TextStyle(letterSpacing: 2, fontSize: 24),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text.rich(TextSpan(
                      text: "Don't have an account?",
                      style: const TextStyle(fontSize: 14),
                      children: <TextSpan>[
                        TextSpan(
                            text: 'Register here',
                            style: const TextStyle(
                              decoration: TextDecoration.underline,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Get.to(() => const RegisterPage());
                              }),
                      ]))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  get onTap {}
}
