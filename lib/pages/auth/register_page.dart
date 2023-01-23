import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:social_media/global_widgets.dart/global_input.dart';
import 'package:social_media/global_widgets.dart/global_validators.dart';
import 'package:social_media/helper/helper_function.dart';
import 'package:social_media/home_page.dart';
import 'package:social_media/provider/onchanged_provider.dart';
import 'package:social_media/service/auth_service.dart';

import '../../styles/colors/app_colors.dart';
import '../../styles/styles/custom_text_style.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  AuthService authService = AuthService();
  bool _isLoading = false;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController nameController;
  late FocusNode emailFocus;
  late FocusNode passwordFocus;
  late FocusNode nameFocus;
  final formKey = GlobalKey<FormState>();
  bool isCorrectName = false;
  bool isCorrectEmail = false;
  bool isCorrectPassword = false;

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
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
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
                        Consumer<OnchangedProvider>(
                          builder: (context, value, child) => GlobalInput(
                            isPassword: false,
                            isCorrect: isCorrectName,
                            onChanged: (n) =>
                                value.nameOnChanged(n, isCorrectName),
                            controller: nameController,
                            validator: (p0) => nameValidator(p0),
                            textFocus: nameFocus,
                            labelText: "Full name",
                            prefixIcon: const Icon(Icons.person),
                          ),
                        ),
                        const SizedBox(height: 15),
                        Consumer<OnchangedProvider>(
                          builder: (context, value, child) => GlobalInput(
                            isPassword: false,
                            isCorrect: isCorrectEmail,
                            onChanged: (e) =>
                                value.emailOnChanged(e, isCorrectEmail),
                            controller: emailController,
                            validator: (p0) => emailValidator(p0),
                            textFocus: emailFocus,
                            labelText: "Email",
                            prefixIcon: const Icon(Icons.email),
                          ),
                        ),
                        const SizedBox(height: 15),
                        Consumer<OnchangedProvider>(
                          builder: (context, value, child) => GlobalInput(
                            isPassword: true,
                            isCorrect: isCorrectPassword,
                            validator: (p0) => passwordValidator(p0),
                            onChanged: (p0) =>
                                value.passwordOnChanged(p0, isCorrectPassword),
                            controller: passwordController,
                            textFocus: passwordFocus,
                            labelText: "Password",
                            prefixIcon: const Icon(Icons.lock),
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
                              register;
                            },
                            child: const Text(
                              "Register",
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

  get register async {
    if (formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });
      await authService
          .registerUserwithEmailAndPassword(emailController.text,
              nameController.text, passwordController.text)
          .then((value) async {
        return {
          if (value == true)
            {
              Get.snackbar('Successfull!', 'You have a new profile',
                  backgroundColor: AppColor.mainColor),
              await HelperFunction.saveUserLoggedInStatus(true),
              await HelperFunction.saveUserEmail(emailController.text),
              await HelperFunction.saveUserName(nameController.text),
              Get.to(() => const HomePage()),
            }
          else
            {
              Get.snackbar('Error', 'Something went wrong',
                  backgroundColor: AppColor.errorColor),
            },
          setState(() {
            _isLoading = false;
          }),
        };
      });
    }
  }
}
