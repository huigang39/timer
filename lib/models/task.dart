class Task {
  String title;
  Duration duration;

  Task({required this.title, required this.duration, completed = false});

  bool completed = false;
}
