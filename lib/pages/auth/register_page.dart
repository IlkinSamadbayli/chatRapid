import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../styles/colors/app_colors.dart';
import '../../styles/styles/custom_text_style.dart';
import '../../styles/styles/global_border_style.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController nameController;
  late FocusNode emailFocus;
  late FocusNode passwordFocus;
  late FocusNode nameFocus;
  final formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';

  @override
  void initState() {
    emailController = TextEditingController();
    nameController = TextEditingController();
    passwordController = TextEditingController();
    emailFocus = FocusNode();
    nameFocus = FocusNode();
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
                    'Register Page',
                    style: CustomTextStyle.largeBoldStyle,
                  ),
                  const SizedBox(height: 50),
                  Image.network(
                    'https://cdn-gdobf.nitrocdn.com/dbfCRUjocDnEsvEYDzbrkWRxxdldwVwM/assets/static/optimized/rev-7e2ac96/za/wp-content/uploads/2021/06/asset6-500x396.png',
                    width: MediaQuery.of(context).size.width * .6,
                    height: MediaQuery.of(context).size.height * .2,
                  ),
                  const SizedBox(height: 50),
                  TextFormField(
                    onChanged: (value) => setState(() {
                      email = value;
                    }),
                    focusNode: nameFocus,
                    controller: nameController,
                    decoration: GlobalBorderStyle.kInputDecoration("Full name"),
                  ),
                  const SizedBox(height: 15),
                  TextFormField(
                    onChanged: (value) => setState(() {
                      email = value;
                    }),
                    focusNode: emailFocus,
                    controller: emailController,
                    decoration: GlobalBorderStyle.kInputDecoration("Email"),
                  ),
                  const SizedBox(height: 15),
                  TextFormField(
                      onChanged: (value) => setState(() {
                            password = value;
                          }),
                      focusNode: passwordFocus,
                      controller: passwordController,
                      decoration:
                          GlobalBorderStyle.kInputDecoration("Password")),
                  const SizedBox(height: 30),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(

                          // padding: const EdgeInsets.symmetric(
                          //     horizontal: 130, vertical: 12),
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
                      text: "Do you have an account?",
                      style: const TextStyle(fontSize: 14),
                      children: <TextSpan>[
                        TextSpan(
                            text: 'Login here',
                            style: const TextStyle(
                              decoration: TextDecoration.underline,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Get.back();
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
