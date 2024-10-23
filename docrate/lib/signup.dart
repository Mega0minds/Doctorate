import 'package:docrate/cont_signup.dart';
import 'package:docrate/login.dart';
import 'package:docrate/utilities/resource.dart';
import 'package:flutter/material.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final _formKey = GlobalKey<FormState>();
  String? _name;
  String? _email;

  void _proceed() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      String username = _name!.trim();
      String email = _email!.toLowerCase().trim();

      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
            builder: (context) => ContSignup(username: username, email: email)),
        (route) => false,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 40),
              const Align(
                alignment: Alignment.topCenter,
                child: Text(
                  "Sign Up",
                  style: TextStyle(
                    fontWeight: AppWeight.mainweight,
                    fontSize: 24,
                    color: AppColor.black,
                  ),
                ),
              ),
              const SizedBox(height: 56),
              Form(
                key: _formKey,
                child: Container(
                  width: 327,
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Full Name",
                        style: TextStyle(
                          fontWeight: AppWeight.signPage,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 12),
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: "Enter Full Name",
                          border: OutlineInputBorder(
                            borderSide: BorderSide(width: 1),
                            borderRadius: BorderRadius.all(Radius.circular(16)),
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Invalid Name";
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _name = value!;
                        },
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        "Email Address",
                        style: TextStyle(
                          fontWeight: AppWeight.signPage,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 12),
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: "Enter email address",
                          border: OutlineInputBorder(
                            borderSide: BorderSide(width: 1),
                            borderRadius: BorderRadius.all(Radius.circular(16)),
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty ||
                              !value.contains(".") ||
                              !value.contains("@")) {
                            return "Invalid Email";
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _email = value!;
                        },
                      ),
                      const SizedBox(height: 32),
                      Center(
                        child: ElevatedButton(
                          onPressed: _proceed,
                          style: ElevatedButton.styleFrom(
                            fixedSize: const Size(237, 56),
                            backgroundColor: AppColor.primary,
                          ),
                          child: const Text(
                            "Continue",
                            style: TextStyle(color: AppColor.white),
                          ),
                        ),
                      ),
                      const SizedBox(height: 32),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Already have an account?",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: AppWeight.createAccount,
                              color: AppColor.opacityBlack,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const LogIn(),
                                ),
                              );
                            },
                            child: const Text(
                              "Sign In",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: AppWeight.secondCreate,
                                color: AppColor.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 32),
                      const Center(
                        child: Text(
                          "OR",
                          style: TextStyle(color: AppColor.opacityBlack),
                        ),
                      ),
                      const SizedBox(height: 32),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: Image.asset(
                              'assets/img/Google.png',
                              width: 56,
                              height: 56,
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Image.asset(
                              'assets/img/Apple.png',
                              width: 56,
                              height: 56,
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Image.asset(
                              'assets/img/Facebook.png',
                              width: 56,
                              height: 56,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
