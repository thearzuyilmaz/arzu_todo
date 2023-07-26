import 'package:flutter/material.dart';
import 'package:arzu_todo/constants.dart';

import '../models/task.dart';

class TileWidget extends StatelessWidget {
  //CircleAvatar? avatar;
  Task task;
  void Function(bool?)? checkboxCallBack;
  void Function()? longPressCallBack;

  TileWidget(
      {required this.task, this.checkboxCallBack, this.longPressCallBack});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: kTileDivider,
      child: ListTile(
        //leading: avatar,
        onLongPress: longPressCallBack,
        title: Text(
          task.name,
          style: TextStyle(
              color: Colors.black,
              decoration: task.isDone ? TextDecoration.lineThrough : null),
        ),
        trailing: CheckboxTheme(
          data: CheckboxThemeData(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0))),
          child: Checkbox(
            value: task.isDone,
            onChanged: checkboxCallBack, // true to false, false to true
          ),
        ),
      ),
    );
  }
}

// AVATAR --------------------

// CircleAvatar(
// child: Icon(
// widget.iconCategory,
// color: widget.iconColor,
// ),
// backgroundColor: widget.iconBackGroundColor,
// ),
