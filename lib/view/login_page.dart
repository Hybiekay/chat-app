import 'package:dating_app/core/constants/images_const.dart';
import 'package:dating_app/core/helper/all_extenson.dart';
import 'package:dating_app/core/theme/custom_colors.dart';
import 'package:dating_app/core/theme/custom_textstyle.dart';
import 'package:dating_app/provider/auth_provider.dart';
import 'package:dating_app/view/widget/widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool isObscure = true;
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
                              text: "Log In",
                              style: CustomTextstyle.title.copyWith(
                                decoration: TextDecoration.underline,
                                decorationThickness: 5,
                                decorationColor: CustomColors.primaryColor,
                                color: CustomColors.black,
                              ),
                              children: [
                                TextSpan(
                                    text: " to Chatbox",
                                    style: CustomTextstyle.title.copyWith(
                                      decoration: TextDecoration.none,
                                      decorationThickness: 5,
                                      decorationColor:
                                          CustomColors.primaryColor,
                                    ))
                              ]),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Text(
                              "Welcome back! Sign in using your social account or email to continue us",
                              textAlign: TextAlign.center,
                              style: CustomTextstyle.body.copyWith(
                                decoration: TextDecoration.none,
                                decorationThickness: 5,
                                decorationColor: CustomColors.primaryColor,
                              )),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          spacing: 20,
                          children: [
                            SocialButton(
                              imagePath: ImagesConst.facebook,
                              borderColor: CustomColors.black,
                            ),
                            SocialButton(
                                imagePath: ImagesConst.google,
                                borderColor: CustomColors.black),
                            SocialButton(
                                imagePath: ImagesConst.apple,
                                borderColor: CustomColors.black,
                                imageColor: CustomColors.black),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        DividerOr(
                          textColor: Colors.black,
                        ),
                        Form(
                          key: formKey,
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              spacing: 10,
                              children: [
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
                                  obscureText: isObscure,
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
                                      hintText: "Enter your password",
                                      suffixIcon: GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            isObscure = !isObscure;
                                          });
                                        },
                                        child: Icon(isObscure
                                            ? Icons.visibility
                                            : Icons.visibility_off),
                                      )),
                                ),
                              ],
                            ),
                          ),
                        ),
                        // Spacer(),
                        80.toHeightWhiteSpace,

                        ElevatedButton(
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              authProvider.login(
                                  context: context,
                                  email: emailController.text,
                                  password: passwordController.text);
                            }
                          },
                          child: Text(
                            "Log In",
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
