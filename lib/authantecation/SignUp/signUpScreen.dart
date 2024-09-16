import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:to_do_appp/authantecation/SignUp/signUpConnector.dart';
import 'package:to_do_appp/authantecation/SignUp/signUpViewModel.dart';
import 'package:to_do_appp/base.dart';
import 'package:to_do_appp/fireBase/firebaseFunctions.dart';

class Signupscreen extends StatefulWidget {
  const Signupscreen({super.key});

  @override
  State<Signupscreen> createState() => _SignupscreenState();
}

class _SignupscreenState extends BaseView<Signupscreen, SignUpViewModel>
    implements SignUpConnector {
  TextEditingController userNameC = TextEditingController();
  TextEditingController emailC = TextEditingController();
  TextEditingController phoneC = TextEditingController();
  TextEditingController passwordC = TextEditingController();

  var formKey = GlobalKey<FormState>();
  @override
  void initState() {
    // TODO: implement initState
    viewmodel.connector = this;
  }

  @override
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
                      return "UserName Required";
                    }

                    return null;
                  },
                  cursorColor: Color(0xFF5D9CEC),
                  controller: userNameC,
                  keyboardType: TextInputType.text,
                  style: Theme.of(context).textTheme.headlineLarge,
                  decoration: InputDecoration(
                    label: Text("UserName"),
                    labelStyle: Theme.of(context).textTheme.headlineLarge,
                  ),
                ),
                SizedBox(
                  height: 25.h,
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
                      return "Phone Required";
                    }
                    final bool phoneValid =
                        RegExp(r'^(?:[+0][1-9])?[0-9]{10,12}$').hasMatch(value);
                    if (!phoneValid) {
                      return "Please Enter Valid Phone";
                    }
                    return null;
                  },
                  cursorColor: Color(0xFF5D9CEC),
                  controller: phoneC,
                  keyboardType: TextInputType.phone,
                  style: Theme.of(context).textTheme.headlineLarge,
                  decoration: InputDecoration(
                    label: Text("Phone"),
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
                        viewmodel.createNewUser(
                          emailAddress: emailC.text,
                          password: passwordC.text,
                          phone: phoneC.text,
                          username: userNameC.text,
                        );
                      }
                    },
                    child: Text(
                      "Regeister",
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
  SignUpViewModel initMyViewModel() {
    return SignUpViewModel();
  }

  @override
  onSuccess() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Registered Succefuly"),
          content: Text("please verify your email then sign in"),
          actions: [
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("OK"))
          ],
        );
      },
    );
  }
}
