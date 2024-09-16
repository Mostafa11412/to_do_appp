import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:to_do_appp/authantecation/login/loginconnector.dart';
import 'package:to_do_appp/base.dart';

class LoginViewModel extends BaseViewModel<LoginConnector> {
  signIn({
    required String emailAddress,
    required String password,
  }) async {
    try {
      connector!.showloading();

      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: emailAddress, password: password);
      if (!credential.user!.emailVerified) {
        connector!.closeLoading();
        connector!.showMessage('Please verify your Email First');
      } else {
        connector!.closeLoading();
        connector!.onSuccess();
      }
      ;
    } on FirebaseAuthException catch (e) {
      connector!.closeLoading();

      connector!.showMessage(e.message!);
    }
  }
}
