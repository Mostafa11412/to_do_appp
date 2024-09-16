import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:to_do_appp/authantecation/auth.dart';
import 'package:to_do_appp/fireBase/firebaseFunctions.dart';
import 'package:to_do_appp/providers/myProviderd.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Welcome  ${provider.userModel?.username ?? ""}",
              style: GoogleFonts.poppins(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF5D9CEC)),
            ),
            SizedBox(
              height: 30.h,
            ),
            ElevatedButton(
              onPressed: () {
                Firebasefunctions.signOut();
                Navigator.pushNamedAndRemoveUntil(
                    context, AuthScreen.RouteName, (context) => false);
              },
              child: Text(
                "Log Out",
                style: Theme.of(context).textTheme.displayMedium,
              ),
              style:
                  ElevatedButton.styleFrom(backgroundColor: Color(0xFF5D9CEC)),
            )
          ],
        ),
      ),
    );
  }
}
