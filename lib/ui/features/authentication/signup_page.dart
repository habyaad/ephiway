import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../core/models/user_model.dart';
import '../../../core/services/auth_services.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _sigupFormKey = GlobalKey<FormState>();

  String _username = '';
  String _email = '';
  String _password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign up'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _sigupFormKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16.0),
              TextFormField(
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  labelText: 'Username',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your username';
                  }
                  return null;
                },
                onSaved: (value) {
                  _username = value!;
                },
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: 'Email address',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your email address';
                  }
                  if (!value.contains('@')) {
                    return 'Please enter a valid email address';
                  }
                  return null;
                },
                onSaved: (value) {
                  _email = value!;
                },
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your password';
                  }
                  if (value.length < 6) {
                    return 'Password must be at least 6 characters';
                  }
                  return null;
                },
                onSaved: (value) {
                  _password = value!;
                },
              ),
              const SizedBox(height: 24.0),
              MaterialButton(
                color: Colors.blueAccent,
                child: const Text('Sign up', style: TextStyle(color: Colors.white),),
                onPressed: () {
                  if (_sigupFormKey.currentState!.validate()) {
                    _sigupFormKey.currentState!.save();
                    // Implement your signup logic here
                    // You can use the _username, _email, and _password variables
                    // to store the user's input and submit it to your server or database
                    // Once the signup process is complete, you can navigate the user to the login page
                    User user = User(username: _username, email:  _email, password: _password);
                    AuthServices.signupUser(user);
                    //context.router.pushNamed("/login-screen");
                  }
                },
              ),
              TextButton(
                onPressed: () {
                  context.router.pushNamed("/login-screen");
                },
                child: const Text('Already have an account'),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
