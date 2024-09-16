import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:to_do_appp/fireBase/firebaseFunctions.dart';
import 'package:to_do_appp/home/addTaskSheet.dart';
import 'package:to_do_appp/home/editTaskSheet%20.dart';
import 'package:to_do_appp/models/taskModel.dart';
import 'package:to_do_appp/myTheme.dart';
import 'package:to_do_appp/providers/myProviderd.dart';

class List_Item extends StatelessWidget {
  TaskModel task;
  List_Item({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
      height: 115.h,
      width: 372.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.r),
          color: provider.isDark? MyTheme.DarkprimaryColor:Colors.white),
      child: Slidable(
        startActionPane: ActionPane(
          motion: BehindMotion(),
          children: [
            SlidableAction(
              autoClose: true,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15.r),
                  topLeft: Radius.circular(15.h)),
              onPressed: (context) {
                Firebasefunctions.deleteTask(task.id!);
              },
              backgroundColor: Color(0xFFFE4A49),
              icon: Icons.delete,
              label: 'Delete',
            ),
            SlidableAction(
              onPressed: (context) {
                showModalBottomSheet(
                  isScrollControlled: true,
                  context: context,
                  builder: (context) {
                    return Padding(
                      padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom),
                      child: editTaskSheet(
                        task: task,
                      ),
                    );
                  },
                );
              },
              backgroundColor: Color(0xFF5D9CEC),
              icon: Icons.edit,
              label: 'Edit',
            ),
          ],
        ),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
          child: Row(
            children: [
              Container(
                height: 80.h,
                width: 10.w,
                decoration: BoxDecoration(
                    color: task.isDone! ? Color(0xFF61E757) : Color(0xFF5D9CEC),
                    borderRadius: BorderRadius.circular(10.r)),
              ),
              SizedBox(
                width: 15.w,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      task.title ?? "",
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: task.isDone!
                                ? Color(0xFF61E757)
                                : Color(0xFF5D9CEC),
                          ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      task.description ?? "",
                      style: Theme.of(context).textTheme.displaySmall,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    )
                  ],
                ),
              ),
              task.isDone!
                  ? Text(
                      "Done!",
                      style: Theme.of(context).textTheme.bodySmall,
                    )
                  : InkWell(
                      onTap: () {
                        task.isDone = true;
                        Firebasefunctions.editTask(task);
                      },
                      child: Container(
                        width: 70.w,
                        height: 35.h,
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(10.r)),
                        child: ImageIcon(
                            color: Colors.white,
                            AssetImage("assets/images/Icon awesome-check.png")),
                      ),
                    )
            ],
          ),
        ),
      ),
    );
  }
}
