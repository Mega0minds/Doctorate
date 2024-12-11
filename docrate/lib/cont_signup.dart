import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:docrate/firebase_files/database.dart';
import 'package:docrate/firebase_files/firebase_authservice.dart';
import 'package:docrate/home.dart';
import 'package:docrate/login.dart';
import 'package:docrate/utilities/resource.dart';
import 'package:docrate/utilities/show_snackbar.dart';
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
  bool _isVisible = true;

  void _toggleVisiblity() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }

  void _handleSignUp(BuildContext context) async {
    String password = _passwordController.text;
    final Database database = Database();

    try {
      User? user =
          await _auth.signUpWithEmailAndPassword(widget.email, password);

      // Save the username in the database or Firestore if necessary
      debugPrint(
          "User is successfully created with username: ${widget.username}");

      await database.storeUserInfo(
        'users',
        'username',
        widget.username,
      );
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Signup successful!'),
            backgroundColor: Colors.green,
            duration: Duration(seconds: 2),
          ),
        );
      }
      if (context.mounted) {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => Home(),
          ),
          (route) => false,
        );
      }
    } on FirebaseAuthException catch (e) {
      // Use the message provided by Firebase

      showSnackBar(context, 'An unknown error occurred.');

      // Improved error message handling
    } catch (e) {
      if (context.mounted) {
        showSnackBar(context, e.toString());
      }
    } finally {
      setState(() {
        _isLoading = false;
      });
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
                          obscureText: _isVisible,
                          decoration: InputDecoration(
                            labelText: "Set Password",
                            border: OutlineInputBorder(
                              borderSide: BorderSide(width: 1),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16)),
                            ),
                            suffixIcon: IconButton(
                                onPressed: _toggleVisiblity,
                                icon: _isVisible
                                    ? Icon(Icons.visibility_off)
                                    : Icon(Icons.remove_red_eye)),
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
                          decoration: InputDecoration(
                              labelText: "Confirm Password",
                              border: OutlineInputBorder(
                                borderSide: BorderSide(width: 1),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(16)),
                              ),
                              suffixIcon: IconButton(
                                onPressed: _toggleVisiblity,
                                icon: _isVisible
                                    ? Icon(Icons.visibility_off)
                                    : Icon(Icons.remove_red_eye),
                              )),
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
