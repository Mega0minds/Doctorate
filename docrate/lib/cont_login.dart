import 'package:docrate/firebase_files/firebase_authservice.dart';
import 'package:docrate/home.dart';
import 'package:docrate/utilities/resource.dart';
import 'package:docrate/utilities/show_snackbar.dart';
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

  void _proceedLogin() async {
    _formkey.currentState!.save(); // Save form to assign value to `_pass`
    String? password = _pass;

    try {
      // Check if the user exists by signing in with email and an invalid password
      User? user = await _auth.signInWithEmailAndPassword(
        widget.email,
        password!,
      );

      if (user != null) {
        // User exists and password is correct
        // if (context.mounted) {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => Home(),
            ),
            (route) => false);
        debugPrint("Sign-in successful");
        // }
      } else {
        showSnackBar(context, 'Incorrect password');
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        showSnackBar(context, 'User doesn\'t exist');
        debugPrint("user not found");
      } else if (e.code == 'wrong-password') {
        showSnackBar(context, 'Incorrect password');
      } else {
        if (context.mounted) {
          showSnackBar(context, e.message ?? 'An unknown error occurred.');
        }
      }
    } catch (e) {
      showSnackBar(context, 'Error: ${e.toString()}');
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
                              onPressed: _proceedLogin,
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
