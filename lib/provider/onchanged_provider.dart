import 'package:flutter/cupertino.dart';

class OnchangedProvider extends ChangeNotifier {
  void emailOnChanged(String value, bool isCorrect) {
    if (!value.contains("@") ||
        !RegExp(r'^[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$').hasMatch(value)) {
      isCorrect = false;
    } else {
      isCorrect = true;
    }
    notifyListeners();
  }

  void passwordOnChanged(String value, bool isCorrect) {
    if (value.length < 8 || !RegExp(r'^[A-Z a-z 0-9]+$').hasMatch(value)) {
      isCorrect = false;
    } else {
      isCorrect = true;
    }
    notifyListeners();
  }

  void nameOnChanged(String name, bool isCorrect) {
    if (name.isEmpty || !RegExp(r'^[A-Z a-z 0-9]+$').hasMatch(name)) {
      isCorrect = false;
    } else {
      isCorrect = true;
    }
    notifyListeners();
  }
}
