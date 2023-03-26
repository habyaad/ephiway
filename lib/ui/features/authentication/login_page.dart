import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/models/user_model.dart';
import '../../../core/providers/user_provider.dart';
import 'services/auth_services.dart';

class LoginScreen extends ConsumerWidget {
  LoginScreen({super.key});

  final _loginFormKey = GlobalKey<FormState>();

  String _email = '';

  String _password = '';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: _loginFormKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 150,
                  child: SvgPicture.network(
                      'https://www.svgrepo.com/show/492680/avatar-girl.svg'), // replace with your own SVG image
                ),
                const SizedBox(height: 30),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      hintText: 'Email',
                      prefixIcon: Icon(Icons.email),
                      filled: true,
                      fillColor: Colors.white,
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
                ),
                const SizedBox(height: 20),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      hintText: 'Password',
                      prefixIcon: Icon(Icons.lock),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    obscureText: true,
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
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () async{
                    if (_loginFormKey.currentState!.validate()) {
                      _loginFormKey.currentState!.save();
                      // Implement your signup logic here
                      // You can use the _username, _email, and _password variables
                      // to store the user's input and submit it to your server or database
                      // Once the signup process is complete, you can navigate the user to the login page
                      final loginDetails = await AuthServices.signinUser({"email":_email, "password": _password});
                      if(loginDetails != null){
                        ref.read(userProvider.notifier).state = User.fromJson(loginDetails);
                        context.router.pushNamed("/home-screen");
                      }
                    }

                  },
                  child: const Text('LOGIN'),
                ),
                const SizedBox(height: 10),
                TextButton(
                  onPressed: () {
                    context.router.pop();
                  },
                  child: const Text('Create an account'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}