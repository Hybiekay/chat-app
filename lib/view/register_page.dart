import 'package:dating_app/core/helper/all_extenson.dart';
import 'package:dating_app/core/theme/custom_colors.dart';
import 'package:dating_app/core/theme/custom_textstyle.dart';
import 'package:dating_app/provider/auth_provider.dart';
import 'package:dating_app/view/widget/widget.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<AuthProvider>(builder: (context, authProvider, _) {
        return authProvider.isLoarding
            ? Loading()
            : Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
                child: SingleChildScrollView(
                  child: Center(
                    child: Column(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.arrow_back,
                            color: CustomColors.black,
                          ),
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        RichText(
                          text: TextSpan(
                              text: "Sign up with ",
                              style: CustomTextstyle.title.copyWith(
                                decoration: TextDecoration.none,
                                decorationThickness: 5,
                                decorationColor: CustomColors.primaryColor,
                                color: CustomColors.black,
                              ),
                              children: [
                                TextSpan(
                                    text: "Email",
                                    style: CustomTextstyle.title.copyWith(
                                      decoration: TextDecoration.underline,
                                      decorationThickness: 5,
                                      decorationColor:
                                          CustomColors.primaryColor,
                                    ))
                              ]),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Text(
                              "Get chatting with friends and family today by signing up for our chat app!",
                              textAlign: TextAlign.center,
                              style: CustomTextstyle.body.copyWith(
                                decoration: TextDecoration.none,
                                decorationThickness: 5,
                                decorationColor: CustomColors.primaryColor,
                              )),
                        ),
                        Form(
                          key: formKey,
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              spacing: 10,
                              children: [
                                Text("Name"),
                                TextFormField(
                                  controller: nameController,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "Name is requred";
                                    } else if (value.length < 3) {
                                      return "Enter a valid name";
                                    } else {
                                      return null;
                                    }
                                  },
                                  decoration: InputDecoration(
                                    hintText: "Enter Your Full name",
                                  ),
                                ),
                                Text("Email"),
                                TextFormField(
                                  controller: emailController,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "Email is requred";
                                    } else if (!value.contains(".") &&
                                        value.contains("@")) {
                                      return "Enter a valid email";
                                    } else {
                                      return null;
                                    }
                                  },
                                  decoration: InputDecoration(
                                    hintText: "Enter Your Email",
                                  ),
                                ),
                                Text("Password"),
                                TextFormField(
                                  controller: passwordController,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "Password is requred";
                                    } else if (value.length < 6) {
                                      return "Password must be grater than 6";
                                    } else {
                                      return null;
                                    }
                                  },
                                  decoration: InputDecoration(
                                      hintText: "Enter your password"),
                                ),
                                Text("Comfrim Password"),
                                TextFormField(
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "Comfrim Password is requred";
                                    } else if (value !=
                                        passwordController.text) {
                                      return "Password must be Equal confirm password";
                                    } else {
                                      return null;
                                    }
                                  },
                                  decoration: InputDecoration(
                                      hintText: "Enter your password"),
                                ),
                              ],
                            ),
                          ),
                        ),
                        50.toHeightWhiteSpace,
                        ElevatedButton(
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              authProvider.register(
                                  context: context,
                                  name: nameController.text,
                                  email: emailController.text,
                                  password: passwordController.text);
                            }
                          },
                          child: Text(
                            "Create Account",
                            style: CustomTextstyle.body
                                .copyWith(color: CustomColors.white),
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          "Forget Password?",
                          style: CustomTextstyle.body.copyWith(
                            color: CustomColors.primaryColor,
                          ),
                        ),
                        SizedBox(height: 40)
                      ],
                    ),
                  ),
                ),
              );
      }),
    );
  }
}
