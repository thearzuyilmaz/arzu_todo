import 'package:flutter/material.dart';
import 'package:date_field/date_field.dart';
import 'package:arzu_todo/models/TaskData.dart';
import 'package:arzu_todo/models/task.dart';
import 'package:provider/provider.dart';

class AddTaskScreen extends StatefulWidget {
  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  DateTime? selectedDate;
  DateTime? selectedTime;
  late String taskTitle;
  bool firstSelected = false;
  bool secondSelected = false;
  bool thirdSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFf2f5f9),
      appBar: AppBar(
        title: const Text('Add New Todo'),
        backgroundColor: const Color(0xFF473a7d),
      ),
      body: Container(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Task Title',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color(0xFF473a7d),
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            TextField(
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), hintText: 'Enter a new task'),
              onChanged: (value) {
                taskTitle = value;
              },
            ),
            const SizedBox(
              height: 15.0,
            ),
            Row(
              children: [
                Text(
                  'Category',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF473a7d),
                  ),
                ),
                SizedBox(
                  width: 15.0,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      firstSelected = !firstSelected;
                      secondSelected = false;
                      thirdSelected = false;
                    });
                  },
                  child: CircleAvatar(
                    backgroundColor:
                        firstSelected ? Colors.black26 : Color(0xFFdfebf5),
                    child: Icon(
                      Icons.article_rounded,
                      color: Color(0xff314b64),
                    ),
                  ),
                ),
                SizedBox(
                  width: 15.0,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      secondSelected = !secondSelected;
                      firstSelected = false;
                      thirdSelected = false;
                    });
                  },
                  child: CircleAvatar(
                    backgroundColor:
                        secondSelected ? Colors.black26 : Color(0xffe5e1f2),
                    child: Icon(
                      Icons.emoji_events_rounded,
                      color: Color(0xff473a7d),
                    ),
                  ),
                ),
                SizedBox(
                  width: 15.0,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      thirdSelected = !thirdSelected;
                      firstSelected = false;
                      secondSelected = false;
                    });
                  },
                  child: CircleAvatar(
                    backgroundColor:
                        thirdSelected ? Colors.black26 : Color(0xfffcf4d4),
                    child: Icon(
                      Icons.event_note_rounded,
                      color: Color(0xff3f3505),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20.0,
            ),
            const Text(
              'When',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color(0xFF473a7d),
              ),
            ),
            const SizedBox(
              height: 15.0,
            ),
            Row(
              children: [
                Expanded(
                  child: DateTimeField(
                      decoration: const InputDecoration(
                        hintText: 'Select Date',
                        border: OutlineInputBorder(),
                      ),
                      selectedDate: selectedDate,
                      mode: DateTimeFieldPickerMode.date,
                      onDateSelected: (DateTime value) {
                        setState(() {
                          selectedDate = value;
                          print(selectedDate);
                        });
                      }),
                ),
                const SizedBox(width: 15.0),
                Expanded(
                  child: DateTimeField(
                      decoration: const InputDecoration(
                        hintText: 'Select Time',
                        border: OutlineInputBorder(),
                      ),
                      selectedDate: selectedTime,
                      mode: DateTimeFieldPickerMode.time,
                      onDateSelected: (DateTime value) {
                        setState(() {
                          selectedTime = value;
                          print(selectedTime);
                        });
                      }),
                ),
              ],
            ),
            SizedBox(
              height: 30.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: ElevatedButton(
                      onPressed: () {
                        Task newTask = Task(name: taskTitle);
                        //Provider.of<TaskData>(context).addNewTask(newTask); //did not work
                        context.read<TaskData>().addNewTask(
                            newTask); //watch does not work. use read to add.
                        Navigator.pop(
                            context); //after adding task, returns to previous page
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll<Color>(
                            Colors.deepOrangeAccent),
                      ),
                      child: Text('Add Task')),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
