class TodoItem {
  String title;
  bool isCompleted;

  TodoItem({required this.title, this.isCompleted = false});
}

class TodoModel {
  List<TodoItem> tasks = [];

  void addTask(String title) {
    tasks.add(TodoItem(title: title));
  }

  void toggleTask(int index) {
    tasks[index].isCompleted = !tasks[index].isCompleted;
  }

  void removeTask(int index) {
    tasks.removeAt(index);
  }

  void editTask(int index, String newTitle) {
    tasks[index].title = newTitle;
  }
}