import 'package:flutter/material.dart';

class LoginControllers {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final GlobalKey<FormState> formKey;

  LoginControllers({
    TextEditingController? emailController,
    TextEditingController? passwordController,
    GlobalKey<FormState>? formKey,
  })  : emailController = emailController ?? TextEditingController(),
        passwordController = passwordController ?? TextEditingController(),
        formKey = formKey ?? GlobalKey<FormState>();

  void dispose() {
    emailController.dispose();
    passwordController.dispose();
  }

  String get email => emailController.text.trim();
  String get password => passwordController.text;

  bool validate() {
    return formKey.currentState?.validate() ?? false;
  }

  void clear() {
    emailController.clear();
    passwordController.clear();
  }
}

