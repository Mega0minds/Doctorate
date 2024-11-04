import 'package:docrate/Firebase_Files/Firebase_authservice.dart';
import 'package:docrate/utilities/resource.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ContLogin extends StatefulWidget {
  const ContLogin({
    super.key,
    required this.email,
  });

  final String email;

  @override
  State<ContLogin> createState() => ContLoginState();
}

class ContLoginState extends State<ContLogin> {
  final _formkey = GlobalKey<FormState>();
  final AuthServce _auth = AuthServce();
  String? _pass;

  void _proceedLogin(BuildContext context) async {

    _formkey.currentState!.save(); // Save form to assign value to `_pass`
    String password = _pass ?? '';

    try {
      User? user = await _auth.signInWithEmailAndPassword(widget.email, password);

      if (user != null) {
        Navigator.pop(context);
        print("Sign-in successful");
      } else {
        _showSnackBar(context, 'Incorrect password');
      }
    } on FirebaseAuthException catch (e) {
      _showSnackBar(context, e.message ?? 'An unknown error occurred.');
    } catch (e) {
      _showSnackBar(context, 'Error: ${e.toString()}');
    }
  }

  void _showSnackBar(BuildContext context, String message) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            message,
            style: const TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.red,
          duration: const Duration(seconds: 3),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 40),
              const Center(
                child: Text(
                  "Sign In",
                  style: TextStyle(
                    color: AppColor.black,
                    fontWeight: AppWeight.mainweight,
                    fontSize: 24,
                  ),
                ),
              ),
              const SizedBox(height: 80),
              Center(
                child: Column(
                  children: [
                    Container(
                      width: 327,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Password",
                            style: TextStyle(
                              color: AppColor.black,
                              fontSize: 16,
                              fontWeight: AppWeight.signPage,
                            ),
                          ),
                          const SizedBox(height: 12),
                          Form(
                            key: _formkey,
                            child: Column(
                              children: [
                                TextFormField(
                                  decoration: const InputDecoration(
                                    labelText: "Enter password",
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(width: 1),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(16),
                                      ),
                                    ),
                                  ),
                                  obscureText: true,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "Invalid password";
                                    }
                                    if (value.length < 6) {
                                      return "Password should be more than 6 characters";
                                    }
                                    return null;
                                  },
                                  onSaved: (value) {
                                    _pass = value;
                                  },
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 32),
                          Center(
                            child: ElevatedButton(
                              onPressed: () => _proceedLogin(context),
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
                                "Don't have an account?",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: AppWeight.createAccount,
                                  color: AppColor.black,
                                ),
                              ),
                              TextButton(
                                onPressed: () {},
                                child: const Text(
                                  "Create Account",
                                  style: TextStyle(
                                    color: AppColor.black,
                                    fontSize: 14,
                                    fontWeight: AppWeight.secondCreate,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 32),
                          const Center(
                            child: Text(
                              "Or",
                              style: TextStyle(
                                color: AppColor.black,
                                fontSize: 14,
                                fontWeight: AppWeight.createAccount,
                              ),
                            ),
                          ),
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
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
