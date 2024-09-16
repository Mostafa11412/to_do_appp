import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:to_do_appp/models/taskModel.dart';
import 'package:to_do_appp/models/userModel.dart';

class Firebasefunctions {
  static CollectionReference<TaskModel> getCollection() {
    return FirebaseFirestore.instance
        .collection("Tasks")
        .withConverter<TaskModel>(
      fromFirestore: (snapshot, _) {
        return TaskModel.fromJson(snapshot.data() ?? {});
      },
      toFirestore: (value, _) {
        return value.tojson();
      },
    );
  }

  static Future<void> addTask(TaskModel model) {
    var collection = getCollection();
    var docRef = collection.doc();
    model.id = docRef.id;
    return docRef.set(model);
  }

  static Stream<QuerySnapshot<TaskModel>> getTasks(DateTime Date) {
    return getCollection()
        .where("userId", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .where("date", isEqualTo: DateUtils.dateOnly(Date))
        .orderBy("title", descending: false)
        .snapshots();
  }

  static Future<void> deleteTask(String TaskId) {
    return getCollection().doc(TaskId).delete();
  }

  static Future<void> editTask(TaskModel task) {
    if (task.id == null) {
      throw ArgumentError("Task ID is required for editing a task.");
    }
    return getCollection().doc(task.id).update(task.tojson());
  }

  static CollectionReference<UserModel> getUserCollection() {
    return FirebaseFirestore.instance
        .collection("Users")
        .withConverter<UserModel>(
      fromFirestore: (snapshot, _) {
        return UserModel.fromJson(snapshot.data() ?? {});
      },
      toFirestore: (value, _) {
        return value.toJson();
      },
    );
  }

  static Future<void> addUser(UserModel user) {
    var collection = getUserCollection();
    var docRef = collection.doc(user.id);
    return docRef.set(user);
  }

  static Future<UserModel?> readUser() async {
    String uid = FirebaseAuth.instance.currentUser!.uid;
    var docRef = await getUserCollection().doc(uid).get();
    return docRef.data();
  }



  

  static signOut() async {
    await FirebaseAuth.instance.signOut();
  }
}
