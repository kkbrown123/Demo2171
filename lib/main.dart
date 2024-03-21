import 'package:demo2171/ClubForum.dart';
import 'package:demo2171/menu.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(LoginApp());
}

class LoginApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _login(BuildContext context) {
    List<dynamic> lst = [];
    String username = _usernameController.text;
    String password = _passwordController.text;

    if (username == 'kevonteh' && password == 'password123') {
      print('Login successful');
      _usernameController.text = '';
      _passwordController.text = '';
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => MenuPage(profileLst: lst)));
    } else {
      print('Login failed');
      _usernameController.text = '';
      _passwordController.text = '';
    }
  }

  @override
  Widget build(BuildContext context) {
    bool obscure = true;

    void toggle() {
      obscure = !obscure;
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _usernameController,
              decoration: const InputDecoration(labelText: 'Username'),
            ),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(labelText: 'Password'),
              obscureText: obscure,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _login(context);
              },
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
