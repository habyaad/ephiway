import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/models/user_model.dart';
import '../../../core/providers/user_provider.dart';
import 'services/auth_services.dart';

class SignupScreen extends StatefulWidget {
  SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _signupFormKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //final auth = ref.read(authControllerProvider.notifier);

    return Scaffold(
/*
      appBar: AppBar(
        backgroundColor: const Color(0xff00BFA5),
        title: const Text('Sign up'),
      ),
*/
      body: SingleChildScrollView(
        child: Form(
          key: _signupFormKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 64.0),
                Image.network(
                  'https://www.pngitem.com/pimgs/m/146-1468479_my-education-logo-hd-png-download.png',
                  width: 200.0,
                  height: 200.0,
                ),
                const SizedBox(height: 32.0),
                const Text('Sign Up',
                    style: TextStyle(
                        fontSize: 24.0, fontWeight: FontWeight.bold)),
                const SizedBox(height: 32.0),
                TextFormField(
                  controller: _usernameController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your username';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: 'Username',
                    prefixIcon: const Icon(Icons.person),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32.0)),
                  ),
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  controller: _emailController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your email';
                    }
                    if (!value.contains('@')) {
                      return 'Please enter a valid email';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: 'Email',
                    prefixIcon: const Icon(Icons.email),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32.0)),
                  ),
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  controller: _passwordController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your password';
                    }
                    if (value.length < 6) {
                      return 'Password must be at least 6 characters';
                    }
                    return null;
                  },
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    prefixIcon: const Icon(Icons.lock),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32.0)),
                  ),
                ),
                const SizedBox(height: 32.0),
                ElevatedButton(
                  onPressed: () {
                    if (_signupFormKey.currentState!.validate()) {
                      final String username = _usernameController.text;
                      final String email = _emailController.text;
                      final String password = _passwordController.text;

                      User user = User(
                          username: username, email: email, password: password);
                      AuthServices.signupUser(user);
                      // TODO: Implement sign up functionality with username, email, and password

                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff00BFA5),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 64.0, vertical: 16.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32.0),
                    ),
                  ),
                  child:
                      const Text('Sign Up', style: TextStyle(fontSize: 16.0)),
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
      ),
      /*Padding(
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
      )*/
    );
  }
}
