import "package:flutter/material.dart";

class HomePageProvider with ChangeNotifier {
  bool? isEligible;
  String? eligibleMessage = " ";

  void cheakEligibility(int age) {
    if (age >= 18) {
      isEligible = true;
      eligibleMessage = " You are Eligible";
      notifyListeners();
    } else {
      isEligible = false;
      eligibleMessage = "You are not Eligible!";
      notifyListeners();
    }
  }
}
