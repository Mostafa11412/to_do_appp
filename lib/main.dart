import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:to_do_appp/authantecation/auth.dart';
import 'package:to_do_appp/fireBase/firebase_options.dart';
import 'package:to_do_appp/home/homeScreen.dart';
import 'package:to_do_appp/myTheme.dart';
import 'package:to_do_appp/providers/myProviderd.dart';
import 'package:to_do_appp/splashScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(ChangeNotifierProvider(
      create: (context) => MyProvider(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return ScreenUtilInit(
      designSize: Size(412, 870),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: provider.firebaseUser == null
              ? AuthScreen.RouteName
              : SplashScreen.RouteName,
          routes: {
            SplashScreen.RouteName: (context) => SplashScreen(),
            HomeScreen.RouteName: (context) => HomeScreen(),
            AuthScreen.RouteName: (context) => AuthScreen(),
          },
          themeMode: provider.isDark ? ThemeMode.dark : ThemeMode.light,
          darkTheme: MyTheme.DarkTheme,
          theme: MyTheme.LightTheme,
        );
      },
    );
  }
}
