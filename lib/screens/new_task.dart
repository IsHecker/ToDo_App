import 'package:flutter/material.dart';
import 'package:flutter_todo_app/widgets/todo_item.dart';

import '../constants/colors.dart';

class TaskCreator extends StatefulWidget {
  const TaskCreator({super.key});

  @override
  State<TaskCreator> createState() => _TaskCreatorState();
}

class _TaskCreatorState extends State<TaskCreator> {

  final _todoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Task'),
        backgroundColor: Colors.white,
      ),
      backgroundColor: tdBGColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(0.0),
              child: Container(

                margin: const EdgeInsets.only(bottom: 20, right: 20, left: 20,),
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5,),

                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(0.0, 0.0),
                      blurRadius: 5.0,
                      spreadRadius: 0.0,
                    ),
                  ],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  controller: _todoController,
                  decoration: const InputDecoration(
                    hintText: 'Add a new todo item',
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            Container(
              width: 100,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(5),
              ),
              child: TextButton(
                onPressed: () {
                  CreateTask();
                },
                child: const Text("Add Task", style: TextStyle(color: Colors.white, fontSize: 17),),

              ),
            ),
          ],
        ),
      ),
    );
  }

  void CreateTask(){
    Navigator.pop(context, {"task":_todoController.text});
  }

}
