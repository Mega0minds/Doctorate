import 'package:docrate/signup.dart';
import 'package:docrate/utilities/resource.dart';
import 'package:flutter/material.dart';

class ContLogin extends StatefulWidget {
  const ContLogin({super.key});

  @override
  State<ContLogin> createState() => _ContLoginState();
}

class _ContLoginState extends State<ContLogin> {
  final _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _showError = false;

  @override
  void dispose() {
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
              const SizedBox(
                height: 40,
              ),
              const Text(
                "Sign In",
                style: TextStyle(
                  color: AppColor.black,
                  fontWeight: AppWeight.mainweight,
                  fontSize: 24,
                ),
              ),
              const SizedBox(
                height: 80,
              ),
              Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
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
                              fontSize: 16,
                              fontWeight: AppWeight.signPage,
                            ),
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          Form(
                            key: _formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextFormField(
                                  controller: _emailController,
                                  decoration: const InputDecoration(
                                    labelText: "Enter password",
                                    // suffixIcon: IconButton(
                                    //     onPressed: () {},
                                    //     icon:  Icons. visibility_off),
                                    //     ),
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(width: 1),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(16),
                                      ),
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value!.isNotEmpty && value.length > 6) {
                                      setState(() {
                                        _showError = false;
                                      });
                                      return null;
                                    } else {
                                      setState(() {
                                        _showError = true;
                                      });
                                      return "";
                                    }
                                  },
                                ),
                                if (_showError)
                                  const Text(
                                    'Password must be more than 6 characters',
                                    style: TextStyle(color: Colors.red),
                                  ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 130),
                                  child: TextButton(
                                    onPressed: () {},
                                    child: const Text(
                                      "Forgot password?",
                                      style: TextStyle(color: AppColor.black),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.center,
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      if (_formKey.currentState!.validate()) {}
                    });
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
              const SizedBox(
                height: 32,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Don't have an account?",
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
                          builder: (context) => const Signup(),
                        ),
                      );
                    },
                    child: const Text(
                      "Create Account",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: AppWeight.secondCreate,
                        color: AppColor.black,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 32,
              ),
              const Text(
                "OR",
                style: TextStyle(color: AppColor.opacityBlack),
              ),
              const SizedBox(
                height: 32,
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
      ),
    );
  }
}
