import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddNewTask extends StatefulWidget {
  const AddNewTask({super.key});

  @override
  State<AddNewTask> createState() => _AddNewTaskState();
}

class _AddNewTaskState extends State<AddNewTask> {
  // Controller to collect user input
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          TextField(
            controller: _titleController,
            maxLength: 50,
            keyboardType: TextInputType.text,
            decoration: const InputDecoration(
              label: Text('Task Title'),
            ),
          ),
          TextField(
            controller: _descriptionController,
            keyboardType: TextInputType.text,
            decoration: const InputDecoration(
              label: Text('Task Description'),
            ),
          ),
          const SizedBox(
            height: 5.0,
          ),
          TextField(
            controller: _dateController,
            keyboardType: TextInputType.text,
            decoration: const InputDecoration(
              label: Text('Task Due Date (day/month/year)'),
            ),
          ),
          const SizedBox(
            height: 30.0,
          ),
          Row(children: [
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                if (_titleController.text.isEmpty ||
                    _descriptionController.text.isEmpty ||
                    _dateController.text.isEmpty) {
                  showDialog(
                      context: context,
                      builder: (ctx) {
                        return const AlertDialog(
                          title: Text('Alert!'),
                          content: Text('Please ensure to provide all fields'),
                        );
                      });
                  Navigator.pop(context);
                } else {
                  CollectionReference collRef =
                      FirebaseFirestore.instance.collection('Task Details');
                  collRef.add({
                    'Title': _titleController.text,
                    'Description': _descriptionController.text,
                    'Due Date': _dateController.text,
                  });
                  Navigator.pop(context);
                }
              },
              child: const Text('Add Task'),
            ),
            const Spacer(),
          ]),
        ],
      ),
    );
  }
}
