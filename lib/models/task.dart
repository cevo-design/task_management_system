// This class stores the data each kind of task should have

class Task {
  Task({
    required this.title,
    required this.description,
    required this.date,
  });

  final String title;
  final String description;
  final DateTime date;
}
