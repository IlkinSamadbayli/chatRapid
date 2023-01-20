import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:social_media/global_widgets.dart/global_validators.dart';
import 'package:social_media/pages/auth/register_page.dart';
import 'package:social_media/provider/onchanged_provider.dart';
import 'package:social_media/styles/styles/custom_text_style.dart';
import '../../global_widgets.dart/global_input.dart';
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
  bool isCorrectEmail = false;
  bool isCorrectPassword = false;
  bool _isLoading = false;

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
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Container(
                  color: const Color.fromARGB(26, 65, 62, 62),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 60),
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
                        Consumer<OnchangedProvider>(
                          builder: (context, value, child) => GlobalInput(
                            prefixIcon: const Icon(Icons.email),
                            isPassword: false,
                            isCorrect: isCorrectEmail,
                            validator: (p0) => emailValidator(p0),
                            onChanged: (e) =>
                                value.emailOnChanged(e, isCorrectEmail),
                            controller: emailController,
                            textFocus: emailFocus,
                            labelText: "Enter email",
                          ),
                        ),
                        const SizedBox(height: 15),
                        Consumer<OnchangedProvider>(
                          builder: (context, value, child) => GlobalInput(
                            prefixIcon: const Icon(Icons.lock),
                            isPassword: true,
                            isCorrect: isCorrectPassword,
                            validator: (p0) => passwordValidator(p0),
                            onChanged: (p0) =>
                                value.passwordOnChanged(p0, isCorrectPassword),
                            controller: passwordController,
                            textFocus: passwordFocus,
                            labelText: "Enter password",
                          ),
                        ),
                        const SizedBox(height: 30),
                        SizedBox(
                          width: double.infinity,
                          height: MediaQuery.of(context).size.height * .07,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: AppColor.mainColor,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16))),
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

  get onTap {
    if (formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });
    }
  }
}
