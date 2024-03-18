import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class TaskItem extends StatefulWidget {
  const TaskItem({super.key});

  @override
  State<TaskItem> createState() => _TaskItemState();
}

class _TaskItemState extends State<TaskItem> {
  bool? isComplete = false;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          const SizedBox(
            height: 4.0,
          ),
          StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection('Task Details')
                .snapshots(),
            builder: (context, snapshot) {
              List<Card> taskItems = [];
              if (snapshot.hasData) {
                final tasks = snapshot.data?.docs.reversed.toList();
                for (var task in tasks!) {
                  final taskItem = Card(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Task: ${task['Title']}'),
                              Text('Description: ${task['Description']}'),
                              Text('Due Date: ${task['Due Date']}'),
                            ],
                          ),
                          const Spacer(),
                          Checkbox(
                            value: isComplete,
                            onChanged: (checked) {
                              setState(() {
                                isComplete = checked;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                  taskItems.add(taskItem);
                }
              }
              return Expanded(
                child: ListView(
                  children: taskItems,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
