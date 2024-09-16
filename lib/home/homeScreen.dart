import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:to_do_appp/authantecation/auth.dart';
import 'package:to_do_appp/fireBase/firebaseFunctions.dart';
import 'package:to_do_appp/home/addTaskSheet.dart';
import 'package:to_do_appp/tabs/list.dart';
import 'package:to_do_appp/tabs/settings.dart';
import 'package:to_do_appp/providers/myProviderd.dart';

class HomeScreen extends StatefulWidget {
  static const String RouteName = "Home";
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);

    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        title: Text('ToDoList'),
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
      ),
      body: Tabs[index],
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        padding: EdgeInsets.zero,
        height: 66.h,
        notchMargin: 12,
        child: BottomNavigationBar(
            currentIndex: index,
            onTap: (value) {
              index = value;
              setState(() {});
            },
            items: [
              BottomNavigationBarItem(
                  label: "",
                  icon: ImageIcon(AssetImage(
                    "assets/images/icon_list.png",
                  ))),
              BottomNavigationBarItem(
                  label: "",
                  icon:
                      ImageIcon(AssetImage("assets/images/icon_settings.png")))
            ]),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            builder: (context) {
              return Padding(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: addTaskSheet(),
              );
            },
          );
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
          size: 35,
        ),
        backgroundColor: Color(0xFF5D9CEC),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.r),
            side: BorderSide(
                width: 4,
                color: provider.isDark ? Color(0xFF141922) : Colors.white)),
      ),
    );
  }

  List<Widget> Tabs = [ListScreen(), Settings()];
}
