import 'package:cloud_firestore/cloud_firestore.dart';

class TaskModel {
  String? id;
  String? title;
  String? description;
  DateTime? Date;
  bool? isDone;
  String? userId;

  TaskModel({
    this.id = "",
    required this.title,
    required this.description,
    required this.Date,
    this.userId,
    this.isDone = false,
  });

  TaskModel.fromJson(Map<String, dynamic> json)
      : this(
            title: json['title'],
            description: json['description'],
            Date: (json['date'] as Timestamp?)?.toDate(),
            id: json['id'],
            isDone: json['isDone'],
            userId: json['userId']);

  Map<String, dynamic> tojson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'date': Date,
      'isDone': isDone,
      'userId': userId,
    };
  }
}
