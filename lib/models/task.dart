import 'package:date_field/date_field.dart';

// ----------------- TASK MODEL -----------------

class Task {
  String name; //required
  bool isDone;
  String category;
  DateTime? selectedDate; //nullable
  DateTime? selectedTime; //nullable

  Task(
      {required this.name,
      this.category = 'firstCategory',
      this.isDone = false,
      this.selectedDate,
      this.selectedTime});

  void toggleDone() {
    isDone = !isDone;
  }
}
