import 'package:cloud_firestore/cloud_firestore.dart';
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
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  bool _showError = false;
  bool _showUser = false;
  bool _isLoading = false;
  bool _showUserError = false;
  bool _emailExist = false;
  // bool isUsernameTaken = false;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
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
                        controller: _nameController,
                        decoration: const InputDecoration(
                          labelText: "Enter Full Name",
                          border: OutlineInputBorder(
                            borderSide: BorderSide(width: 1),
                            borderRadius: BorderRadius.all(Radius.circular(16)),
                          ),
                        ),
                        validator: (value) {
                          if (value!.isNotEmpty) {
                            setState(() {
                              _showUser = false;
                            });
                            return null;
                          } else {
                            setState(() {
                              _showUser = true;
                            });
                            return "Invalid Name";
                          }
                        },
                      ),
                      if (_showUser)
                        const Text(
                          'Invalid Name',
                          style: TextStyle(color: Colors.red),
                        ),
                      if (_showUserError)
                        const Text(
                          "User already exists",
                          style: TextStyle(color: Colors.red),
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
                        controller: _emailController,
                        decoration: const InputDecoration(
                          labelText: "Enter email address",
                          border: OutlineInputBorder(
                            borderSide: BorderSide(width: 1),
                            borderRadius: BorderRadius.all(Radius.circular(16)),
                          ),
                        ),
                        validator: (value) {
                          if (value!.isNotEmpty && value.contains(".")) {
                            setState(() {
                              _showError = false;
                            });
                            return null;
                          } else {
                            setState(() {
                              _showError = true;
                            });
                            return "Invalid Email";
                          }
                        },
                      ),
                      if (_showError)
                        const Text(
                          'Invalid Email',
                          style: TextStyle(color: Colors.red),
                        ),
                        if (_emailExist)
                        const Text(
                          "Email already exist",
                          style: TextStyle(color: Colors.red),
                        ),
                      const SizedBox(height: 32),
                      GestureDetector(
                        onTap: null,
                        child: Container(
                          alignment: Alignment.center,
                          child: ElevatedButton(
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                if (!_isLoading) {
                                  setState(() {
                                    _isLoading = true; // Show loading indicator
                                  });
                                  await _signUp(); // Call _signUp directly
                                }
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              fixedSize: const Size(237, 56),
                              backgroundColor: AppColor.primary,
                            ),
                            child: _isLoading
                                ? const CircularProgressIndicator(
                                    color: AppColor.white,
                                  )
                                : const Text(
                                    "Continue",
                                    style: TextStyle(color: AppColor.white),
                                  ),
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

  Future<void> _signUp() async {
    String username = _nameController.text;
    String email = _emailController.text;

    // Check if username exists
    bool isUsernameTaken = await _checkIfUsernameExists(username);
    bool isEmailTaken = await _checkIfEmailExists(email);

    print(isUsernameTaken);
    print(username);
    if (isUsernameTaken == true) {
      setState(() {
        _isLoading = false;
        _showUserError = true; // Show error message
      });
      print("exist");
    } else {
      setState(() {
        // _showUserError = false;
        _isLoading = false;
      });
      // Proceed with navigation to the next screen
      if(isEmailTaken == true){
              setState(() {
        _isLoading = false;
        _emailExist = true; // Show error message
      });
      print("exist");
      }else{
              print("Does't exist");
      await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ContSignup(username: username, email: email),
        ),
      );
      }

    }
  }

  // Function to check if the username exists in Firestore
  Future<bool> _checkIfUsernameExists(String username) async {
    final querySnapshot = await FirebaseFirestore.instance
        .collection('users')
        .where('username', isEqualTo: username)
        .get();
    print("succsess");
    return querySnapshot.docs.isNotEmpty;
  }

  Future<bool> _checkIfEmailExists(String email) async {
    final querySnapshot = await FirebaseFirestore.instance
        .collection('users')
        .where('email', isEqualTo: email)
        .get();
    return querySnapshot.docs.isNotEmpty;
  }
}
