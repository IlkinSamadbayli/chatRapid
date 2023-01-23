import 'package:flutter/material.dart';
import 'package:social_media/styles/styles/custom_text_style.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
      body: Center(child: ElevatedButton(child: const Text("data"),onPressed: () {
        
      },)),
    );
  }
}
