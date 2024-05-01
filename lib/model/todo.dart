class ToDo {
  String? taskName;
  bool isDone;

  ToDo({
    required this.taskName,
    this.isDone = false,
  });

  static List<ToDo> todoList = [
      ToDo(taskName: 'Morning Excercise', isDone: true ),
      ToDo(taskName: 'Buy Groceries', isDone: true ),
      ToDo(taskName: 'Check Emails', ),
      ToDo(taskName: 'Team Meeting', ),
      ToDo(taskName: 'Work on mobile apps for 2 hour', ),
      ToDo(taskName: 'Dinner with Jenny', ),
    ];

}