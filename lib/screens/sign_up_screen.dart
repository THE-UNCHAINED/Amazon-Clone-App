import 'dart:developer';

import 'package:amazon_clone/resources/authetication_methods.dart';
import 'package:amazon_clone/screens/sign_in_screen.dart';
import 'package:amazon_clone/utils/color_themes.dart';
import 'package:amazon_clone/utils/constants.dart';
import 'package:amazon_clone/widgets/custom_main_button.dart';
import 'package:amazon_clone/widgets/text_field_widgets.dart';
import 'package:flutter/material.dart';

import '../utils/utils.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  AutheticationMethods autheticationMethods = AutheticationMethods();
  bool isLoading = false;

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    addressController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = Utils().getScreenSize();
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SizedBox(
          height: screenSize.height,
          width: screenSize.width,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.network(
                    amazonLogo,
                    height: screenSize.height * 0.10,
                  ),
                  Container(
                    padding: const EdgeInsets.all(20),
                    height: screenSize.height * 0.6,
                    width: screenSize.width * 0.8,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 2),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Sign Up",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 30,
                              fontWeight: FontWeight.w500),
                        ),
                        TextFieldWidget(
                          hintText: "",
                          tittle: 'Name',
                          controller: nameController,
                          obsecureText: false,
                        ),
                        TextFieldWidget(
                          hintText: "",
                          tittle: 'Address',
                          controller: addressController,
                          obsecureText: false,
                        ),
                        TextFieldWidget(
                          hintText: "",
                          tittle: 'Email',
                          controller: emailController,
                          obsecureText: false,
                        ),
                        TextFieldWidget(
                          hintText: "",
                          tittle: 'Password',
                          controller: passwordController,
                          obsecureText: true,
                        ),
                        const SizedBox(
                          height: 10,
                        )
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomMainButton(
                          color: yellowColor,
                          isLoading: isLoading,
                          onPressed: () async {
                            setState(() {
                              isLoading = true;
                            });

                            String output =
                                await autheticationMethods.signUpUser(
                                    name: nameController.text,
                                    address: addressController.text,
                                    email: emailController.text,
                                    password: passwordController.text);
                            setState(() {
                                isLoading = false;
                              },
                            );
                            if (output == "success") {
                              //Function
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return const SignInScreen();
                                  },
                                ),
                              );
                            } else {
                              //error
                              Utils().showSnackBar(
                                  context: context, content: output);
                            }
                          },
                          child: const Text("Sign Up")),
                    ],
                  ),
                  CustomMainButton(
                    color: Colors.white10,
                    isLoading: false,
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const SignInScreen();
                          },
                        ),
                      );
                    },
                    child: const Text(
                      "Back",
                      style: TextStyle(color: Colors.black, letterSpacing: 0.6),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
