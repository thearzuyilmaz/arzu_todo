import 'package:flutter/material.dart';
import 'package:arzu_todo/screens/AddTaskScreen.dart';
import 'package:arzu_todo/widgets/list_widget.dart';
import 'package:arzu_todo/models/task.dart';
import 'package:provider/provider.dart';
import 'package:arzu_todo/models/TaskData.dart';

class TodoList extends StatefulWidget {
  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFf2f5f9),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: Container(height: 50.0),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddTaskScreen(),
            ),
          );
        },
        backgroundColor: Colors.deepOrangeAccent,
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            color: const Color(0xFF473a7d),
            height: 170.0,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'My Todo List',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '${Provider.of<TaskData>(context).taskCount} Tasks', //we used the taskCount getter from the TaskData model
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Transform.translate(
              offset: Offset(0.0, -75.0),
              child: Padding(
                padding: EdgeInsets.only(
                    top: 35.0, left: 30.0, right: 30.0), //outside
                child: Container(
                  padding: EdgeInsets.all(10.0), //inside
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(20.0),
                    ),
                  ),
                  child: ListWidget(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
