import 'package:docrate/login.dart';
import 'package:docrate/utilities/resource.dart';
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
            Center(
              child: const Text(
                "Sign In",
                style: TextStyle(
                  color: AppColor.black,
                  fontWeight: AppWeight.mainweight,
                  fontSize: 24,
                ),
              ),
            ),
            const SizedBox(
              height: 80,
            ),
            Center(
              child: Column(
                children: [
                  Container(
                    width: 327,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Password",
                          style: TextStyle(
                              color: AppColor.black,
                              fontSize: 16,
                              fontWeight: AppWeight.signPage),
                        ),
                        const SizedBox(
                          height: 12,
                         
                        ),
                        Form(
                          key: _formkey,
                          child: Column(
                            children: [
                              TextFormField(
                                decoration: InputDecoration(
                                  labelText: "Enter password",
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(width: 1),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(16),
                                    ),
                                  ),
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Invalid password";
                                  }
                                  if (value.length < 6) {
                                    return "Password should be more than 6 characters";
                                  } else {
                                    return null;
                                  }
                                },
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 32,
                        ),
                        Container(
                          alignment: Alignment.center,
                          child: ElevatedButton(
                            onPressed: () {
                              if (_formkey.currentState!.validate()) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const LogIn(),
                                  ),
                                );
                              }
                            },
                            style: ElevatedButton.styleFrom(
                                fixedSize: const Size(237, 56),
                                backgroundColor: AppColor.primary),
                            child: Text(
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
                            Text(
                              "Don't have an account?",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: AppWeight.createAccount,
                                  color: AppColor.black),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                "Create Account",
                                style: TextStyle(
                                  color: AppColor.black,
                                  fontSize: 14,
                                  fontWeight: AppWeight.secondCreate,
                                ),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 32,
                        ),
                        Center(
                          child: Text(
                            "Or",
                            style: TextStyle(
                                color: AppColor.black,
                                fontSize: 14,
                                fontWeight: AppWeight.createAccount),
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
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}
