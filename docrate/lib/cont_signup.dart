import 'package:docrate/Firebase_Files/Firebase_authservice.dart';
import 'package:docrate/login.dart';
import 'package:docrate/utilities/resource.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ContSignup extends StatefulWidget {
  const ContSignup({
    Key? key,
    required this.username,
    required this.email,
  }) : super(key: key);

  final String username;
  final String email;

  @override
  State<ContSignup> createState() => _ContSignupState();
}

class _ContSignupState extends State<ContSignup> {
  final AuthServce _auth = AuthServce();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  bool _showError = false;
  bool _passwordValid = false;
  bool _isLoading = false;

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
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
                              borderRadius: BorderRadius.all(Radius.circular(16)),
                            ),
                          ),
                          validator: (value) {
                            if (value != null && value.length > 6) {
                              setState(() {
                                _passwordValid = true;
                              });
                              return null;
                            } else {
                              setState(() {
                                _passwordValid = false;
                              });
                              return "Password must be more than 6 characters";
                            }
                          },
                        ),
                        if (!_passwordValid)
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
                              borderRadius: BorderRadius.all(Radius.circular(16)),
                            ),
                          ),
                          validator: (value) {
                            if (value == _passwordController.text) {
                              setState(() {
                                _showError = false;
                              });
                              return null;
                            } else {
                              setState(() {
                                _showError = true;
                              });
                              return "Passwords do not match";
                            }
                          },
                        ),
                        if (_showError)
                          const Text(
                            'Confirm Password again',
                            style: TextStyle(color: Colors.red),
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
                            _handleSignUp();
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

  void _handleSignUp() async {
    String password = _passwordController.text;

    try {
      User? user = await _auth.signUpWithEmailAndPassword(widget.email, password);

      if (user != null) {
        // Save the username in the database or Firestore if necessary
        print("User is successfully created with username: ${widget.username}");
        // Navigate to the next screen or show success message
        Navigator.pop(context); // or any other navigation logic
      } else {
        print("Error: User creation failed.");
        // Handle the error (e.g., show a message)
      }
    } catch (e) {
      print("Error: $e");
      // Handle the error (e.g., show an error message)
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }
}
