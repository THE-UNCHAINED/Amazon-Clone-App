import 'dart:developer';

import 'package:amazon_clone/layout/screen_layout.dart';
import 'package:amazon_clone/resources/authetication_methods.dart';
import 'package:amazon_clone/screens/sign_up_screen.dart';
import 'package:amazon_clone/utils/color_themes.dart';
import 'package:amazon_clone/utils/constants.dart';
import 'package:amazon_clone/widgets/custom_main_button.dart';
import 'package:amazon_clone/widgets/text_field_widgets.dart';
import 'package:flutter/material.dart';
import 'package:amazon_clone/utils/utils.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  AutheticationMethods autheticationMethods = AutheticationMethods();

  @override
  // dispose method for Controller
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }
  bool isLoading = false;

  Widget build(BuildContext context) {
    //variables
    Size screenSize = Utils().getScreenSize();


    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SizedBox(
          height: screenSize.height,
          width: screenSize.width,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
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
                    padding: EdgeInsets.all(20),
                    height: screenSize.height * 0.6,
                    width: screenSize.width * 0.8,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 2)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Sign In",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 30,
                              fontWeight: FontWeight.w500),
                        ),
                        TextFieldWidget(
                          hintText: "Enter Your Email",
                          tittle: 'Email',
                          controller: emailController,
                          obsecureText: false,
                        ),
                        TextFieldWidget(
                          hintText: "Enter your Password",
                          tittle: 'Password',
                          controller: passwordController,
                          obsecureText: true,
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: CustomMainButton(
                              child: Text("Sign In"),
                              color: yellowColor,
                              isLoading: isLoading,
                              onPressed: () async {
                                setState(() {
                                  isLoading = true;
                                });
                                Future.delayed(Duration(seconds: 2));
                                String output =
                                    await autheticationMethods.signInUser(
                                        email: emailController.text,
                                        password: passwordController.text);
                                setState(() {
                                  isLoading = false;
                                });

                                if (output == "success") {
                                  // function

                                  log("Proceeding");
                                } else {
                                  log("success");
                                  Utils().showSnackBar(
                                      context: context, content: output);
                                }
                              }),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: Container(
                        height: 1,
                        color: Colors.grey,
                        width: screenSize.width,
                      )),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: Text(
                          "New to Amazon?",
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                      Expanded(
                          child: Container(
                        height: 1,
                        color: Colors.grey,
                        width: screenSize.width,
                      )),
                    ],
                  ),
                  CustomMainButton(
                    color: Colors.white10,
                    child: Text(
                      "Create an Amazon Account",
                      style: TextStyle(color: Colors.black, letterSpacing: 0.6),
                    ),
                    isLoading: false,
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return SignUpScreen();
                          },
                        ),
                      );
                    },
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
