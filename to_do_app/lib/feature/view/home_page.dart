import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/feature/view_model/home_view_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('To-Do List'),
        bottom: const PreferredSize(
            preferredSize: Size.fromHeight(4),
            child: Divider(
              color: Colors.teal,
              thickness: 2.0,
            )),
      ),
      body: Consumer<HomeViewModel>(
        builder: (context, taskViewModel, child) {
          if (taskViewModel.tasks.isEmpty) {
            // Eğer veriler hala yükleniyorsa
            return listEmptyBody();
          }
          return homeBody(taskViewModel);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showForm(context),
        child: const Icon(Icons.add),
      ),
    );
  }

  Center listEmptyBody() {
    return const Center(
        child: Text(
      'Henüz bir görev eklenmedi.',
      style: TextStyle(fontSize: 24.0),
    ));
  }

  ListView homeBody(HomeViewModel taskViewModel) {
    return ListView.builder(
      itemCount: taskViewModel.tasks.length,
      itemBuilder: (context, index) {
        final task = taskViewModel.tasks[index];
        return Card(
          margin: const EdgeInsets.all(8.0),
          child: ListTile(
            title: Text(task.title),
            subtitle: Text(task.description),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: () => _showForm(context, task),
                ),
                IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () => taskViewModel.deleteTask(task.id!),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showForm(BuildContext context, [Task? task]) {
    final titleController = TextEditingController();
    final descriptionController = TextEditingController();

    if (task != null) {
      titleController.text = task.title;
      descriptionController.text = task.description;
    }

    showModalBottomSheet(
      context: context,
      builder: (_) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: titleController,
                decoration: const InputDecoration(labelText: 'Title'),
              ),
              TextField(
                controller: descriptionController,
                decoration: const InputDecoration(labelText: 'Description'),
              ),
              ElevatedButton(
                onPressed: () {
                  final taskViewModel =
                      Provider.of<HomeViewModel>(context, listen: false);
                  if (task == null) {
                    taskViewModel.addTask(Task(
                      title: titleController.text,
                      description: descriptionController.text,
                    ));
                  } else {
                    taskViewModel.updateTask(Task(
                      id: task.id,
                      title: titleController.text,
                      description: descriptionController.text,
                    ));
                  }
                  Navigator.of(context).pop();
                },
                child: Text(task == null ? 'Add Task' : 'Update Task'),
              ),
            ],
          ),
        );
      },
    );
  }
}
