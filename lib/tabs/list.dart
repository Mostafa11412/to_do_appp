import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do_appp/fireBase/firebaseFunctions.dart';
import 'package:to_do_appp/home/list_item.dart';
import 'package:to_do_appp/myTheme.dart';
import 'package:to_do_appp/models/taskModel.dart';

class ListScreen extends StatefulWidget {
  ListScreen({super.key});

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          DatePicker(
            height: 95.h,
            DateTime.now(),
            initialSelectedDate: selectedDate,
            selectionColor: MyTheme.primaryColor,
            selectedTextColor: Colors.white,
            onDateChange: (date) {
              selectedDate = date;
              setState(() {});
            },
          ),
          Expanded(
            child: StreamBuilder<QuerySnapshot<TaskModel>>(
              stream: Firebasefunctions.getTasks(selectedDate),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }
                if (snapshot.hasError) {
                  return Column(
                    children: [
                      Text(
                        "Something went Wrong",
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      ElevatedButton(onPressed: () {}, child: Text("Try again"))
                    ],
                  );
                }

                List<dynamic> Tasks =
                    snapshot.data?.docs.map((e) => e.data()).toList() ?? [];

                if (Tasks.isEmpty) {
                  return Center(
                    child: Text("No Tasks Added to this Day",
                        style: Theme.of(context).textTheme.bodyLarge),
                  );
                }
                return ListView.builder(
                  itemCount: Tasks.length,
                  itemBuilder: (BuildContext context, int index) {
                    return List_Item(
                      task: Tasks[index],
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
