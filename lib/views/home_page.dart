import 'package:flutter/material.dart';
import 'package:myapp3/controllers/todo_controller.dart';
import 'package:myapp3/views/todo_list_item.dart';

class HomePage extends StatefulWidget {
  final TodoController todoController;

  const HomePage({super.key, required this.todoController});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/background.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Main Content
          Column(
            children: [
              AppBar(
                title: const Text('My ToDo List'),
                backgroundColor: Color.fromARGB(255, 2, 49, 14),
                foregroundColor: Colors.white,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: widget.todoController.tasks.length,
                  itemBuilder: (BuildContext context, index) {
                    final task = widget.todoController.tasks[index];
                    return TodoListItem(
                      taskName: task.title,
                      taskCompleted: task.isCompleted,
                      onChanged: (value) {
                        setState(() {
                          widget.todoController.toggleTask(index);
                        });
                      },
                      deleteFunction: (context) {
                        setState(() {
                          widget.todoController.removeTask(index);
                        });
                      },
                      editFunction: (newTitle) {
                        setState(() {
                          widget.todoController.editTask(index, newTitle);
                        });
                      },
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: TextField(
                          controller: _controller,
                          decoration: InputDecoration(
                            hintText: 'Add a new todo item',
                            filled: true,
                            fillColor: Color.fromARGB(255, 116, 209, 181),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Color.fromARGB(255, 2, 49, 14),
                              ),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Color.fromARGB(255, 2, 49, 14),
                              ),
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                        ),
                      ),
                    ),
                    FloatingActionButton(
                      onPressed: () {
                        setState(() {
                          widget.todoController.addTask(_controller.text);
                          _controller.clear();
                        });
                      },
                      child: const Icon(Icons.add),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}