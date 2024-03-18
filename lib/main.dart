import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:task_management_system/widgets/add_new_task.dart';
import 'package:task_management_system/widgets/task_item.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Dashboard(),
  ));
}

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  void _openAddTasksOverlay() {
    showModalBottomSheet(
      context: context,
      builder: (ctx) => const AddNewTask(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TASK MANAGEMENT'),
        actions: [
          IconButton(
            onPressed: _openAddTasksOverlay,
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Column(
            children: const [
              SizedBox(
                height: 20,
              ),
              Text('Click on the + button to add a new task'),
              TaskItem(),
            ],
          ),
        ),
      ),
    );
  }
}
