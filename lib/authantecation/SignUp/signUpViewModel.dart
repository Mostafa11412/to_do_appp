import 'package:firebase_auth/firebase_auth.dart';
import 'package:to_do_appp/authantecation/SignUp/signUpConnector.dart';
import 'package:to_do_appp/base.dart';
import 'package:to_do_appp/fireBase/firebaseFunctions.dart';
import 'package:to_do_appp/models/userModel.dart';

class SignUpViewModel extends BaseViewModel<SignUpConnector> {
  void createNewUser({
    required String emailAddress,
    required String password,
    required String phone,
    required String username,
  }) async {
    try {
      connector!.showloading();
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      credential.user!.sendEmailVerification();
      UserModel user = UserModel(
          id: credential.user?.uid ?? "",
          username: username,
          phone: phone,
          email: emailAddress);
      Firebasefunctions.addUser(user).then((value) {
        connector!.closeLoading();
        connector!.onSuccess();
      }).catchError((e) {
        connector!.closeLoading();
        connector!.showMessage(e.message);
      });
    } on FirebaseAuthException catch (e) {
      connector!.closeLoading();
      connector!.showMessage(e.message ?? "");
    }
  }
}
