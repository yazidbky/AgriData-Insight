import 'package:flutter/material.dart';

class RegistrationControllers {
  final TextEditingController firstNameController;
  final TextEditingController lastNameController;
  final TextEditingController cityController;
  final TextEditingController emailController;
  final TextEditingController usernameController;
  final TextEditingController phoneNumberController;
  final TextEditingController passwordController;
  final TextEditingController passwordConfirmationController;
  final GlobalKey<FormState> formKey;

  RegistrationControllers({
    TextEditingController? firstNameController,
    TextEditingController? lastNameController,
    TextEditingController? cityController,
    TextEditingController? emailController,
    TextEditingController? usernameController,
    TextEditingController? phoneNumberController,
    TextEditingController? passwordController,
    TextEditingController? passwordConfirmationController,
    GlobalKey<FormState>? formKey,
  })  : firstNameController = firstNameController ?? TextEditingController(),
        lastNameController = lastNameController ?? TextEditingController(),
        cityController = cityController ?? TextEditingController(),
        emailController = emailController ?? TextEditingController(),
        usernameController = usernameController ?? TextEditingController(),
        phoneNumberController = phoneNumberController ?? TextEditingController(),
        passwordController = passwordController ?? TextEditingController(),
        passwordConfirmationController = passwordConfirmationController ?? TextEditingController(),
        formKey = formKey ?? GlobalKey<FormState>();

  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    cityController.dispose();
    emailController.dispose();
    usernameController.dispose();
    phoneNumberController.dispose();
    passwordController.dispose();
    passwordConfirmationController.dispose();
  }

  String get fullName => '${firstNameController.text.trim()} ${lastNameController.text.trim()}'.trim();
  String get email => emailController.text.trim();
  String get username => usernameController.text.trim();
  String get phoneNumber => phoneNumberController.text.trim();
  String get password => passwordController.text;
  String get city => cityController.text.trim();

  bool validate() {
    return formKey.currentState?.validate() ?? false;
  }

  void clear() {
    firstNameController.clear();
    lastNameController.clear();
    cityController.clear();
    emailController.clear();
    usernameController.clear();
    phoneNumberController.clear();
    passwordController.clear();
    passwordConfirmationController.clear();
  }
}

