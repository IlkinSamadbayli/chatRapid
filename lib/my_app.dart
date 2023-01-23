import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'helper/helper_function.dart';
import 'home_page.dart';
import 'pages/auth/login_page.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isLoginStatus = false;

  @override
  void initState() {
    getUserLoggedInStatus;
    super.initState();
  }

  get getUserLoggedInStatus async {
    await HelperFunction.getUserLoggedInStatus.then((value) {
      if (value != null) {
        setState(() {
          value = isLoginStatus;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: isLoginStatus ? const HomePage() : const LoginPage(),
    );
  }
}
