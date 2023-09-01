import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../controllers/task_controller.dart';
import 'task_entry_screen.dart';

class TaskListView extends StatelessWidget {
  final TaskController taskController = Get.put(TaskController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task Manager'),
      ),
      body: Obx(
        () {
          final sortedTasks = taskController.tasks.toList()
            ..sort((a, b) => a.dueDate.compareTo(b.dueDate));

          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: sortedTasks.length,
            itemBuilder: (context, index) {
              final task = sortedTasks[index];
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: ListTile(
                  title: Text(task.title),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(task.description),
                      Text(
                        "Due date: ${DateFormat('yyyy-MM-dd').format(task.dueDate)}",
                      )
                    ],
                  ),
                  trailing: IconButton(
                    onPressed: () {
                      taskController.deleteTask(index);
                    },
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.red,
                    ),
                  ),
                  onTap: () {
                    // Navigate to the task detail/edit page
                  },
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(AddTaskView()); // Navigate to the add task page
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
