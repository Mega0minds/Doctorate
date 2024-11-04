import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:docrate/Firebase_Files/Firebase_authservice.dart';
import 'package:docrate/login.dart';
import 'package:docrate/utilities/resource.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ContSignup extends StatefulWidget {
  const ContSignup({
    super.key,
    required this.username,
    required this.email,
  });

  final String username;
  final String email;

  @override
  State<ContSignup> createState() => _ContSignupState();
}

class _ContSignupState extends State<ContSignup> {
  final AuthServce _auth = AuthServce();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  bool _passwordValid = false;
  bool _isLoading = false;

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }

  void _handleSignUp(BuildContext context) async {
    String password = _passwordController.text;

    try {
      User? user =
          await _auth.signUpWithEmailAndPassword(widget.email, password);

      if (user != null) {
        // Save the username in the database or Firestore if necessary
        print("User is successfully created with username: ${widget.username}");
        await FirebaseFirestore.instance.collection('users').doc(user.uid).set({
          'username': widget.username,
          'email': widget.email,
        });
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Signup successful!'),
            backgroundColor: Colors.green,
            duration: Duration(seconds: 2),
          ),
        );

        Navigator.pop(context);
      } else {
        throw Exception("Email is used by another account.");
      }
    } on FirebaseAuthException catch (e) {
      // Use the message provided by Firebase
      _showSnackBar(context, e.message ?? 'An unknown error occurred.');
      // Improved error message handling
    } catch (e) {
      _showSnackBar(context, e.toString());
    } finally {
      setState(() {
        _isLoading = false;
      });
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
              const Text(
                "Sign Up",
                style: TextStyle(
                  color: AppColor.black,
                  fontWeight: AppWeight.mainweight,
                  fontSize: 24,
                ),
              ),
              const SizedBox(height: 80),
              Center(
                child: Container(
                  width: 327,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Set Password",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: AppWeight.signPage,
                          ),
                        ),
                        const SizedBox(height: 12),
                        TextFormField(
                          controller: _passwordController,
                          decoration: const InputDecoration(
                            labelText: "Set Password",
                            border: OutlineInputBorder(
                              borderSide: BorderSide(width: 1),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16)),
                            ),
                          ),
                          validator: (value) {
                            if (value != null && value.length > 6) {
                              setState(() {
                                _passwordValid = false;
                              });
                              return null;
                            } else {
                              setState(() {
                                _passwordValid = true;
                              });
                              return "Password must be more than 6 characters";
                            }
                          },
                        ),
                        if (_passwordValid)
                          const Text(
                            'Password must be more than 6 characters',
                            style: TextStyle(color: Colors.red),
                          ),
                        const SizedBox(height: 16),
                        const Text(
                          "Confirm Password",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: AppWeight.signPage,
                          ),
                        ),
                        const SizedBox(height: 12),
                        TextFormField(
                          decoration: const InputDecoration(
                            labelText: "Confirm Password",
                            border: OutlineInputBorder(
                              borderSide: BorderSide(width: 1),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16)),
                            ),
                          ),
                          validator: (value) {
                            if (value == _passwordController.text) {
                              return null;
                            } else {
                              return "Passwords do not match";
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 32),
              Container(
                alignment: Alignment.center,
                child: ElevatedButton(
                  onPressed: _isLoading
                      ? null
                      : () {
                          if (_formKey.currentState!.validate()) {
                            setState(() {
                              _isLoading = true;
                            });
                            _handleSignUp(context);
                          }
                        },
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(237, 56),
                    backgroundColor: AppColor.primary,
                  ),
                  child: _isLoading
                      ? const CircularProgressIndicator(color: AppColor.white)
                      : const Text(
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
              const Text(
                "OR",
                style: TextStyle(color: AppColor.opacityBlack),
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
    );
  }
}
