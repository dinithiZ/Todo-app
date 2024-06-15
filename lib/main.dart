import 'package:flutter/material.dart';
import 'package:myapp3/controllers/todo_controller.dart';
import 'package:myapp3/views/sign_in_page.dart';
import 'package:myapp3/views/sign_up_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final TodoController _todoController = TodoController();

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainPage(todoController: _todoController),
    );
  }
}

class MainPage extends StatelessWidget {
  final TodoController todoController;

  const MainPage({super.key, required this.todoController});

  @override
  Widget build(BuildContext context) {
  return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image.asset(
            'assets/background.jpg',
            fit: BoxFit.cover,
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    'Welcome to My ToDo App',
                    style: TextStyle(
                      fontSize: 32.0,
                      fontFamily:  'SpicyRice',
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 17, 4, 39),
                    ),
                  ),
                  SizedBox(height: 32.0),
                  ElevatedButton(
                    child: Text('Sign In'),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignInPage()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  ElevatedButton(
                    child: Text('Sign Up'),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignUpPage()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}