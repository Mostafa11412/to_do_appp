import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:to_do_appp/fireBase/firebaseFunctions.dart';
import 'package:to_do_appp/models/taskModel.dart';
import 'package:to_do_appp/myTheme.dart';
import 'package:to_do_appp/providers/myProviderd.dart';

class addTaskSheet extends StatefulWidget {
  addTaskSheet({super.key});

  @override
  State<addTaskSheet> createState() => _addTaskSheetState();
}

class _addTaskSheetState extends State<addTaskSheet> {
  DateTime chosenDate = DateTime.now();
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);

    return Container(
      padding: EdgeInsets.symmetric(vertical: 22.h, horizontal: 24.w),
      color: provider.isDark ? MyTheme.DarkprimaryColor : Colors.white,
      height: 460.h,
      child: Form(
        key: formKey,
        child: Column(
          children: [
            Text(
              "Add New Task",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            SizedBox(
              height: 15.h,
            ),
            TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Task Title Is Required";
                }

                return null;
              },
              style: Theme.of(context).textTheme.bodyMedium,
              decoration: InputDecoration(
                hintText: "Enter Task Title",
                hintStyle: Theme.of(context).textTheme.bodyMedium,
              ),
              controller: titleController,
            ),
            SizedBox(
              height: 30.h,
            ),
            TextFormField(
              style: Theme.of(context).textTheme.bodyMedium,
              decoration: InputDecoration(
                hintText: "Enter Task Description",
                hintStyle: Theme.of(context).textTheme.bodyMedium,
              ),
              controller: descriptionController,
            ),
            SizedBox(
              height: 30.h,
            ),
            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                "Select Time",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
            InkWell(
              onTap: () async {
                DateTime? chosenDatetemp = await showDatePicker(
                    context: context,
                    initialDate: chosenDate,
                    firstDate: DateTime.now(),
                    lastDate: DateTime.now().add(Duration(days: 365)));
                if (chosenDatetemp != null) {
                  chosenDate = chosenDatetemp;
                  setState(() {});
                }
              },
              child: Text(
                chosenDate.toString().substring(0, 10),
                textAlign: TextAlign.left,
                style: Theme.of(context).textTheme.displayLarge,
              ),
            ),
            Spacer(),
            Container(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      TaskModel model = TaskModel(
                          userId: FirebaseAuth.instance.currentUser!.uid,
                          title: titleController.text,
                          description: descriptionController.text,
                          Date: DateUtils.dateOnly(chosenDate));
                      Firebasefunctions.addTask(model).then((value) {
                        Navigator.pop(context);
                      });
                    }
                  },
                  child: Text(
                    "Add Task",
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF5D9CEC)),
                ))
          ],
        ),
      ),
    );
  }
}
