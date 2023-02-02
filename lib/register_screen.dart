import 'package:barter_app/home_screen.dart';
import 'package:barter_app/login_screen.dart';
import 'package:barter_app/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  register() async {
    if (formKey.currentState!.validate()) {
      FirebaseAuth auth = FirebaseAuth.instance;
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
      print(userCredential.additionalUserInfo.toString());
      if (auth.currentUser != null) {
        Navigator.pushReplacement(
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
                  const Text('Create your account now to chat and explore',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w400)),
                  Image.asset('assets/images/register.png'),
                  const SizedBox(
                    height: 15,
                  ),
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
                        register();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).primaryColor,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: const Text(
                        'Register',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                  Text.rich(TextSpan(
                    text: "Already have an account?",
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                          text: ' Login here',
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                            decoration: TextDecoration.underline,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.pop(context);
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
