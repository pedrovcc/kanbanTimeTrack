import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:stime_strack/core/theme/app_colors.dart';
import 'package:stime_strack/global_widgets/primary_button.dart';
import 'package:stime_strack/global_widgets/secondary_button.dart';
import 'package:stime_strack/modules/landing/landing_page.dart';
import 'package:stime_strack/modules/register/register_page.dart';

import '../../global_widgets/text_form_field/standard_text_form_field.dart';

class LoginPage extends StatefulWidget {
  static const ROUTE = '/login';

  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
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
            padding: EdgeInsets.fromLTRB(20, height * 0.2, 20, 0),
            child: Column(
              children: [
                Image.asset("assets/images/kanbanImage.png", fit: BoxFit.fitWidth, width: 120, height: 120),
                const SizedBox(height: 36),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Welcome to Kanban!",
                    style: Get.textTheme.headlineSmall?.copyWith(color: AppColors.whiteSurface),
                  ),
                ),
                const SizedBox(height: 50),
                StandardTextField(
                  isPasswordType: false,
                  labelText: 'Username',
                  controller: _usernameTextController,
                  icon: const Icon(Icons.person_outline, color: AppColors.whiteSmoke),
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
                    onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
                          return const LandingPage();
                        })),
                    child: const Text("Login")),
                const SizedBox(height: 140),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Text(
                    "Don't have an account?",
                    style: Get.textTheme.subtitle2?.copyWith(color: AppColors.blackDisabled),
                  ),
                  SecondaryButton(
                      child: const Text("Register!"),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const RegisterPage()));
                      })
                ]),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
