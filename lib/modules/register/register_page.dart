import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:stime_strack/core/theme/app_colors.dart';
import 'package:stime_strack/global_widgets/primary_button.dart';
import 'package:stime_strack/global_widgets/text_form_field/standard_text_form_field.dart';
import 'package:stime_strack/modules/landing/landing_page.dart';

class RegisterPage extends StatefulWidget {
  static const ROUTE = '/register';

  const RegisterPage({super.key});

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _usernameTextController = TextEditingController();
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text("Sign Up", style: Get.textTheme.headlineMedium?.copyWith(color: AppColors.whiteSurface), textAlign: TextAlign.center),
        ),
        body: GestureDetector(
          onTap: () {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Container(
            height: height,
            width: width,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    colors: [AppColors.blueWarmVivid50, AppColors.grey50, AppColors.whiteSurface],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter)),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 120, 20, 0),
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    StandardTextField(
                      isPasswordType: false,
                      labelText: 'Username',
                      controller: _usernameTextController,
                      icon: const Icon(Icons.person_outline, color: AppColors.whiteSmoke),
                    ),
                    const SizedBox(height: 16),
                    StandardTextField(
                      isPasswordType: false,
                      labelText: 'E-mail',
                      controller: _emailTextController,
                      icon: const Icon(Icons.mail_outline, color: AppColors.whiteSmoke),
                    ),
                    const SizedBox(height: 16),
                    StandardTextField(
                      isPasswordType: true,
                      labelText: 'Password',
                      controller: _passwordTextController,
                      icon: const Icon(Icons.visibility_outlined, color: AppColors.whiteSmoke),
                    ),
                    const SizedBox(height: 36),
                    PrimaryButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const LandingPage()));
                        },
                        child: const Text("Sign Up")),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
