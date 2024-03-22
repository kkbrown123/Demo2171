import 'package:demo2171/RegisteredClubs.dart';
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
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Login Error'),
            content: const Text(
                'The information seems to be incorrect please try again'),
            actions: <Widget>[
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Close'),
              ),
            ],
          );
        },
      );
      _usernameController.text = '';
      _passwordController.text = '';
    }
  }

  bool obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextField(
                  controller: _usernameController,
                  decoration: InputDecoration(
                    labelText: 'Username',
                    prefixIcon: Icon(Icons.person),
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 16.0),
                TextField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: IconButton(
                      icon: Icon(
                        !obscurePassword
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                      onPressed: () {
                        setState(() {
                          if (obscurePassword) {
                            obscurePassword = !obscurePassword;
                          } else {
                            obscurePassword = true;
                          }
                          print(obscurePassword);
                        });
                      },
                    ),
                    border: OutlineInputBorder(),
                  ),
                  obscureText: obscurePassword,
                ),
                SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {
                    _login(context);
                  },
                  child: Text('Login'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
