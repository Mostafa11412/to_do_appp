import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:to_do_appp/authantecation/login/signInScreen.dart';
import 'package:to_do_appp/authantecation/SignUp/signUpScreen.dart';
import 'package:to_do_appp/providers/myProviderd.dart';

class AuthScreen extends StatefulWidget {
  static const String RouteName = "Auth";
  AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);

    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text('ToDoList'),
            centerTitle: true,
            actions: [
                        Icon(provider.isDark?Icons.dark_mode : Icons.dark_mode),

              Transform.scale(
                scale: .8,
                child: Switch(
                  activeColor: provider.isDark ? Colors.white : Colors.black,
                  value: provider.isDark,
                  onChanged: (valuee) {
                    setState(() {
                      provider.changeTheme();
                    });
                  },
                ),
              )
            ],
            bottom: TabBar(
                indicatorPadding: EdgeInsets.only(bottom: 1.h),
                indicatorColor: Colors.black,
                tabs: [
                  Tab(
                    child: Text(
                      "SignIn",
                      style: GoogleFonts.poppins(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Tab(
                    child: Text(
                      "SignUp",
                      style: GoogleFonts.poppins(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      ),
                    ),
                  )
                ]),
          ),
          body: TabBarView(children: [SignInscreen(), Signupscreen()]),
        ));
  }
}
