import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:social_media/styles/styles/custom_text_style.dart';

import 'styles/colors/app_colors.dart';
import 'styles/styles/global_border_style.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  FirebaseAuth auth = FirebaseAuth.instance;
  late FirebaseFirestore _firestore;
  late TextEditingController mailController;
  late TextEditingController passwordController;
  late CollectionReference _userCollection;

  @override
  void initState() {
    _userCollection = _firestore.collection('users');
    mailController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.menu, size: 30),
        title: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              "ƏMLAK.AZ",
              style: CustomTextStyle.littleStyleBold,
            ),
            Text(
              'ƏMLAK ALQI-SATQISI',
              style: CustomTextStyle.moreTinyStyle,
            ),
          ],
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 8),
            child: Icon(Icons.notifications_outlined, size: 30),
          ),
        ],
      ),
      body: Container(
        color: const Color.fromARGB(26, 65, 62, 62),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(height: 50),
              TextField(
                controller: mailController,
                decoration: GlobalBorderStyle.kInputDecoration("Enter mail"),
              ),
              const SizedBox(height: 30),
              TextField(
                  controller: passwordController,
                  decoration:
                      GlobalBorderStyle.kInputDecoration("Enter password")),
              const SizedBox(height: 30),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 25),
                    backgroundColor: AppColor.mainColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32))),
                onPressed: () {},
                child: const Text("Sign in"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
