import 'package:barter_app/home_screen.dart';
import 'package:barter_app/register_screen.dart';
import 'package:barter_app/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  login() async {
    if (formKey.currentState!.validate()) {
      FirebaseAuth auth = FirebaseAuth.instance;
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
      print(userCredential.user?.email.toString());
      if (auth.currentUser != null) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomeScreen()));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (() => FocusManager.instance.primaryFocus?.unfocus()),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 80),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Bart-lo',
                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text('Login now to see what they are talking!',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w400)),
                  Image.asset('assets/images/login.png'),
                  TextFormField(
                    controller: emailController,
                    decoration: textInputDecoration.copyWith(
                      labelText: 'Email',
                      labelStyle: TextStyle(fontSize: 16),
                      prefixIcon: Icon(
                        Icons.email_rounded,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    validator: (value) =>
                        RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                .hasMatch(value!)
                            ? null
                            : 'Please enter a valid email address',
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    obscureText: true,
                    controller: passwordController,
                    decoration: textInputDecoration.copyWith(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                      labelText: 'Password',
                      labelStyle: TextStyle(fontSize: 16),
                      prefixIcon: Icon(
                        Icons.lock_rounded,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    validator: ((value) {
                      if (value!.length < 6) {
                        return 'Password must be at least 6 characters';
                      }
                      return null;
                    }),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        login();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).primaryColor,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: const Text(
                        'Login',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                  Text.rich(TextSpan(
                    text: "Don't have an account yet?",
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                          text: ' Register here',
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                            decoration: TextDecoration.underline,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              nextScreen(context, const RegisterScreen());
                            }),
                    ],
                  )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
