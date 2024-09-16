import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:to_do_appp/fireBase/firebaseFunctions.dart';
import 'package:to_do_appp/models/userModel.dart';

class MyProvider extends ChangeNotifier {
  User? firebaseUser;
  UserModel? userModel;
  bool isDark = true;

  MyProvider() {
    firebaseUser = FirebaseAuth.instance.currentUser;
    if (firebaseUser != null) {
      initUser();
    }
  }
  changeTheme() {
    isDark = !isDark;
    notifyListeners();
  }

  initUser() async {
    userModel = await Firebasefunctions.readUser();
    notifyListeners();
  }
}
