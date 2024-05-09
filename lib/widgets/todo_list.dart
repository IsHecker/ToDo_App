import '../model/todo.dart';
class TodoList{
  static List<TodoTask> todoList = [
    TodoTask(taskName: 'Morning Excercise', isDone: true ),
    TodoTask(taskName: 'Buy Groceries', isDone: true ),
    TodoTask(taskName: 'Check Emails', ),
    TodoTask(taskName: 'Team Meeting', ),
    TodoTask(taskName: 'Work on mobile apps for 2 hour', ),
    TodoTask(taskName: 'Dinner with Jenny', ),
  ];
}