import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_media/home_page.dart';
import 'package:social_media/pages/auth/login_page.dart';

import 'helper/helper_function.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isLoginStatus = false;

  @override
  void initState() {
    getStatusLoggedIn;
    super.initState();
  }

  get getStatusLoggedIn async {
    await HelperFunction.getUserLoggedInStatus.then((value) {
      if (value != null) {
        value = isLoginStatus;
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
