import 'package:flutter/material.dart';
import '../widgets/todo_list.dart';


import '../model/todo.dart';
import '../constants/colors.dart';
import '../widgets/todo_tile.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final todosList = TodoList.todoList;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: tdBGColor,

      appBar: AppBar(
          backgroundColor: tdBGColor,
          elevation: 0,
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              child: Column(
                children: [
                  const Center(child: Text("TO-DO", style: TextStyle(fontSize: 20),)),
                  Center(child: Image.asset('assets/images/icon.png', scale: 5,))
                ],
              ), ),
            ListTile(
              leading: const Icon(Icons.search),
              title: const Text("Search Task"),
              onTap: (){
                _search();
              },
            ),
            ListTile(
              leading: const Icon(Icons.add),
              title: const Text("Add New Task"),
              onTap: (){
                _addToDoItem();
              },
            )
          ],
        ),
      ),

      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 15,
            ),

            child: Column(
              children: [
                Expanded(
                  child: ListView(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 50, bottom: 20,),

                        child: const Text(
                          'ToDo List',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'roboto'
                          ),
                        ),
                      ),

                      for (TodoTask todoo in todosList.reversed)
                        ToDoTile(
                          todo: todoo,
                          onToDoChanged: _handleToDoChange,
                          onDeleteItem: _deleteToDoItem,
                        ),

                    ],
                  ),
                )
              ],
            ),
          ),

          // Aligns the bottom buttons
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
              Container(
                margin: const EdgeInsets.only(
                  bottom: 20,
                    left: 20
                ),
                child: FloatingActionButton(
                  onPressed: ()  {
                     _search();
                  },
                  child: const Icon(Icons.search, size: 30,color: Colors.white,),
                  shape: const CircleBorder(),
                  backgroundColor: tdBlue,
                  elevation: 10,
                ),

              ),
              // SizedBox(width: 350,),
              Container(
                margin: const EdgeInsets.only(
                  bottom: 20,
                  right: 20
                ),
                child: FloatingActionButton(
                  onPressed: (){
                    _addToDoItem();
                  },

                  child: const Icon(Icons.add, size: 30,color: Colors.white,),
                  shape: const CircleBorder(),
                  backgroundColor: tdBlue,
                  elevation: 10,
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }

  void _handleToDoChange(TodoTask todo) {
    setState(() {
      todo.isDone = !todo.isDone;
    });
  }

  void _deleteToDoItem(String taskName) {
    setState(() {
      todosList.removeWhere((item) => item.taskName == taskName);
    });
  }

  void _addToDoItem() async {
    dynamic result = await Navigator.pushNamed(context, '/TaskCreator');

    setState(() {
      todosList.add(TodoTask(taskName: result["task"]));
    });
  }

  void _search() async {
    await Navigator.pushNamed(context, '/Search');
    setState(() {});
  }

}
