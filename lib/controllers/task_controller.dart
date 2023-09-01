import 'dart:convert'; 
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';
import '../models/task_model.dart';

class TaskController extends GetxController {
  var tasks = <Task>[].obs;
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController dueDateController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    _loadTasks();
  }

  // Add a task
  void addTask() {
    final title = titleController.text;
    final description = descriptionController.text;
    final dueDate = DateTime.tryParse(dueDateController.text);

    if (title.isNotEmpty && description.isNotEmpty && dueDate != null) {
      tasks.add(Task(
        title: title,
        description: description,
        dueDate: dueDate,
      ));
      _saveTasks();
      // Clear input fields
      titleController.clear();
      descriptionController.clear();
      dueDateController.clear();
    } else {
      // Show an error message
      Get.snackbar(
        'Error',
        'Please fill in all fields correctly',
        backgroundColor: Colors.red,
      );
    }
  }

  // Edit a task
  void editTask(int index, Task newTask) {
    tasks[index] = newTask;
    _saveTasks();
  }

  // Delete a task
  void deleteTask(int index) {
    tasks.removeAt(index);
    _saveTasks();
  }

  // Load tasks from SharedPreferences
  void _loadTasks() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final taskStrings = prefs.getStringList('tasks');
    if (taskStrings != null) {
      tasks.assignAll(
        taskStrings.map(
          (str) => Task.fromJson(jsonDecode(str)),
        ),
      );
    }
  }

  // Save tasks to SharedPreferences
  void _saveTasks() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> taskStrings = tasks.map((task) => jsonEncode(task.toJson())).toList();
    prefs.setStringList('tasks', taskStrings);
  }
}
