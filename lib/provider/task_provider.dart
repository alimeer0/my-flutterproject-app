import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/task.dart';

class TaskProvider extends ChangeNotifier{
  List <Task>_tasks=[];
  List <Task> get tasks=>_tasks;
  void addtask(t){
   _tasks.add(Task(title: t)); 
   notifyListeners();

  }
  void removetask(index){
    _tasks.removeAt(index);
    notifyListeners();
  }
}