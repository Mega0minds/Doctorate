import 'package:docrate/login.dart';
import 'package:docrate/utilities/resource.dart';
import 'package:flutter/material.dart';

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
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  bool _showError = false;
  bool _passwordValid = false;
  bool _isObscured = true; // For password visibility
  bool _isConfirmObscured = true; // For confirm password visibility

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
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
                          obscureText: _isObscured,
                          decoration: InputDecoration(
                            labelText: "Set Password",
                            border: const OutlineInputBorder(
                              borderSide: BorderSide(width: 1),
                              borderRadius: BorderRadius.all(Radius.circular(16)),
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(
                                _isObscured ? Icons.visibility : Icons.visibility_off,
                              ),
                              onPressed: () {
                                setState(() {
                                  _isObscured = !_isObscured;
                                });
                              },
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
                          controller: _confirmPasswordController,
                          obscureText: _isConfirmObscured,
                          decoration: InputDecoration(
                            labelText: "Confirm Password",
                            border: const OutlineInputBorder(
                              borderSide: BorderSide(width: 1),
                              borderRadius: BorderRadius.all(Radius.circular(16)),
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(
                                _isConfirmObscured ? Icons.visibility : Icons.visibility_off,
                              ),
                              onPressed: () {
                                setState(() {
                                  _isConfirmObscured = !_isConfirmObscured;
                                });
                              },
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
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Handle successful signup logic here
                      print('Username: ${widget.username}, Email: ${widget.email}, Password: ${_passwordController.text}');
                      // Navigate to next screen or perform other actions
                    }
                  },
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
