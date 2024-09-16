import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:to_do_appp/authantecation/login/loginViewModel.dart';
import 'package:to_do_appp/authantecation/login/loginconnector.dart';
import 'package:to_do_appp/base.dart';
import 'package:to_do_appp/fireBase/firebaseFunctions.dart';
import 'package:to_do_appp/home/homeScreen.dart';
import 'package:to_do_appp/providers/myProviderd.dart';

class SignInscreen extends StatefulWidget {
  SignInscreen({super.key});

  @override
  State<SignInscreen> createState() => _SignInscreenState();
}

class _SignInscreenState extends BaseView<SignInscreen, LoginViewModel>
    implements LoginConnector {
  TextEditingController emailC = TextEditingController();
  TextEditingController passwordC = TextEditingController();

  var formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    viewmodel.connector = this;
  }

  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => viewmodel,
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                SizedBox(
                  height: 30.h,
                ),
                Image.asset(
                  "assets/images/logo.png",
                  fit: BoxFit.fill,
                ),
                SizedBox(
                  height: 40.h,
                ),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Email Address Required";
                    }
                    final bool emailValid = RegExp(
                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                        .hasMatch(value);
                    if (!emailValid) {
                      return "Please Enter Valid Email";
                    }
                    return null;
                  },
                  cursorColor: Color(0xFF5D9CEC),
                  controller: emailC,
                  keyboardType: TextInputType.emailAddress,
                  style: Theme.of(context).textTheme.headlineLarge,
                  decoration: InputDecoration(
                    label: Text("Email Address"),
                    labelStyle: Theme.of(context).textTheme.headlineLarge,
                  ),
                ),
                SizedBox(
                  height: 25.h,
                ),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Password Required";
                    }
                    final bool PasswordValid =
                        RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$')
                            .hasMatch(value);
                    if (!PasswordValid) {
                      return "Please Enter Valid Password";
                    }
                    return null;
                  },
                  cursorColor: Color(0xFF5D9CEC),
                  controller: passwordC,
                  obscureText: true,
                  style: Theme.of(context).textTheme.headlineLarge,
                  decoration: InputDecoration(
                    label: Text("Password"),
                    labelStyle: Theme.of(context).textTheme.headlineLarge,
                  ),
                ),
                SizedBox(
                  height: 25.h,
                ),
                Container(
                  width: 200.w,
                  child: ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        viewmodel.signIn(
                            emailAddress: emailC.text,
                            password: passwordC.text);
                      }
                    },
                    child: Text(
                      "Sign In",
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF5D9CEC)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  onSuccess() {
    Navigator.pushNamedAndRemoveUntil(
      context,
      HomeScreen.RouteName,
      (route) => false,
    );
  }

  @override
  LoginViewModel initMyViewModel() {
    return LoginViewModel();
  }
}
