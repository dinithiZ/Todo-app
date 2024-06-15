import 'package:myapp3/models/todo_model.dart';

class TodoController {
  final TodoModel _model = TodoModel();

  List<TodoItem> get tasks => _model.tasks;

  void addTask(String title) {
    _model.addTask(title);
  }

  void toggleTask(int index) {
    _model.toggleTask(index);
  }

  void removeTask(int index) {
    _model.removeTask(index);
  }

  void editTask(int index, String newTitle) {
    _model.editTask(index, newTitle);
  }
}