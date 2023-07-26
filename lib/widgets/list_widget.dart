import 'package:flutter/material.dart';
import 'package:arzu_todo/widgets/tile_widget.dart';
import 'package:provider/provider.dart';
import 'package:arzu_todo/models/TaskData.dart';
import 'package:arzu_todo/models/task.dart';

class ListWidget extends StatelessWidget {
// Consumer widget de kullanılabilir burada, Angela'nın 206. dersinde 16.dk'ya bak

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        final task = context.read<TaskData>().tasks[index];
        return TileWidget(
            task: task,
            longPressCallBack: () {
              context.read<TaskData>().deleteTask(task);
            },
            checkboxCallBack: (value) {
              if (value != null) {
                context.read<TaskData>().updateCheckness(task);
                // false to true, true to false
              }
            });
      },
      itemCount: context
          .read<TaskData>()
          .taskCount, // taskCount getter from TaskData model
    );
  }
}
