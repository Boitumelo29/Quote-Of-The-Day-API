import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

const String title = "Login Screen";

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              controller: email,
              decoration: const InputDecoration(hintText: "Email"),
            ),
            TextFormField(
              controller: email,
              decoration: const InputDecoration(hintText: "Password"),
            ),
          ],
        ),
      ),
    );
  }
}
