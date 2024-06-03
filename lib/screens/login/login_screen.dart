import 'package:flutter/material.dart';
import 'package:quoteoftheday/data_service/data_service.dart';

void main() => runApp(LoginScreen());

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

const String title = "Login Screen";

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController username = TextEditingController();

  DataService dataService = DataService();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(),
              const Icon(Icons.queue_play_next_outlined),
              TextFormField(
                controller: username,
                decoration: const InputDecoration(hintText: "username"),
              ),
              TextFormField(
                controller: email,
                decoration: const InputDecoration(hintText: "email"),
              ),
              TextFormField(
                controller: password,
                decoration: const InputDecoration(hintText: "Password"),
              ),
              ElevatedButton(
                  onPressed: () {
                    DataService.createUser(email.toString(), password.toString(),
                        username.toString());
                  },
                  child: Text("Enter"))
            ],
          ),
        ),
      ),
    );
  }
}
