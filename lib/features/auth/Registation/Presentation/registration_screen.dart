import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:makers_hackathon/core/Helpers/Routing.dart';
import 'package:makers_hackathon/core/Helpers/regex.dart';
import 'package:makers_hackathon/core/theme/app_colors.dart';
import 'package:makers_hackathon/core/widgets/app_snack_bar.dart';
import 'package:makers_hackathon/core/widgets/custom_button.dart';
import 'package:makers_hackathon/core/widgets/custom_text.dart';
import 'package:makers_hackathon/core/widgets/custom_text_field.dart';
import 'package:makers_hackathon/core/widgets/size_config.dart';
import 'package:makers_hackathon/features/Auth/Login/Presentation/widgets/login_social_buttons.dart';
import 'package:makers_hackathon/features/Auth/Registation/Data/Models/registration_request_model.dart';
import 'package:makers_hackathon/features/Auth/Registation/Logic/registration_cubit.dart';
import 'package:makers_hackathon/features/Auth/Registation/Logic/registration_state.dart';
import 'package:makers_hackathon/features/Auth/Registation/Presentation/controllers/registration_controllers.dart';
import 'package:makers_hackathon/features/Auth/Registation/Presentation/widgets/registration_logo_section.dart';

class RegistrationScreen extends StatefulWidget {
  final RegistrationCubit registrationCubit;

  const RegistrationScreen({
    super.key,
    required this.registrationCubit,
  });

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  late RegistrationControllers _controllers;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _controllers = RegistrationControllers();

    // Listen to cubit state changes
    widget.registrationCubit.stream.listen((state) {
      if (mounted) {
        setState(() {
          _isLoading = state is RegistrationLoading;
        });

        if (state is RegistrationSuccess) {
          // Navigate to login screen immediately
          context.pushReplacementNamed('/login');
          
          // Show success message using AppSnackBar after navigation
          // Using a small delay to ensure context is ready
          
            if (mounted && context.mounted) {
              showAppSnackBar(
                context: context,
                message: state.successMessage,
                icon: Icons.check_circle_outline,
                backgroundColor: AppColors.primary,
                behavior: SnackBarBehavior.floating,
              );
            }
         
        } else if (state is RegistrationFailure) {
          // Show error message using AppSnackBar
          showAppSnackBar(
            context: context,
            message: state.failureMessage,
            icon: Icons.error_outline,
            backgroundColor: AppColors.error,
            behavior: SnackBarBehavior.floating,
          );
        }
      }
    });
  }

  @override
  void dispose() {
    _controllers.dispose();
    super.dispose();
  }

  String _getFcmToken() {
    // TODO: Get actual FCM token from Firebase Messaging
    // For now, returning empty string - should be replaced with actual FCM token
    // Example: return await FirebaseMessaging.instance.getToken() ?? '';
    return '';
  }

  void _handleRegistration() {
    if (_controllers.validate()) {
      widget.registrationCubit.register(
        RegistrationRequestModel(
          fullName: _controllers.fullName,
          email: _controllers.email,
          username: _controllers.username,
          phoneNumber: _controllers.phoneNumber,
          password: _controllers.password,
          fcmToken: _getFcmToken(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: SizeConfig.scalePadding(
            horizontal: 6,
            vertical: 2,
          ),
          child: Form(
            key: _controllers.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const RegistrationLogoSection(),
                // First Name Field
                CustomTextField(
                  controller: _controllers.firstNameController,
                  label: 'First Name',
                  hintText: 'enter your first name',
                  textInputAction: TextInputAction.next,
                  fillColor: AppColors.lightPrimary,
                  enabledBorderColor: AppColors.lightPrimary,
                  focusedBorderColor: AppColors.primary,
                  borderRadius: SizeConfig.scaleRadius(3),
                  fontSize: 14,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your first name';
                    }
                    return null;
                  },
                ),
                SizedBox(height: SizeConfig.scaleHeight(2.5)),
                // Last Name Field
                CustomTextField(
                  controller: _controllers.lastNameController,
                  label: 'Last Name',
                  hintText: 'enter your last name',
                  textInputAction: TextInputAction.next,
                  fillColor: AppColors.lightPrimary,
                  enabledBorderColor: AppColors.lightPrimary,
                  focusedBorderColor: AppColors.primary,
                  borderRadius: SizeConfig.scaleRadius(3),
                  fontSize: 14,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your last name';
                    }
                    return null;
                  },
                ),
                SizedBox(height: SizeConfig.scaleHeight(2.5)),
                // City Field
                CustomTextField(
                  controller: _controllers.cityController,
                  label: 'City',
                  hintText: 'choose your city',
                  textInputAction: TextInputAction.next,
                  fillColor: AppColors.lightPrimary,
                  enabledBorderColor: AppColors.lightPrimary,
                  focusedBorderColor: AppColors.primary,
                  borderRadius: SizeConfig.scaleRadius(3),
                  fontSize: 14,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your city';
                    }
                    return null;
                  },
                ),
                SizedBox(height: SizeConfig.scaleHeight(2.5)),
                // Email Field
                CustomTextField(
                  controller: _controllers.emailController,
                  label: 'Email',
                  hintText: 'your email here',
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  fillColor: AppColors.lightPrimary,
                  enabledBorderColor: AppColors.lightPrimary,
                  focusedBorderColor: AppColors.primary,
                  borderRadius: SizeConfig.scaleRadius(3),
                  fontSize: 14,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    if (!AppRegex.isEmailValid(value.trim())) {
                      return 'Please enter a valid email';
                    }
                    return null;
                  },
                ),
                SizedBox(height: SizeConfig.scaleHeight(2.5)),
                // Username Field
                CustomTextField(
                  controller: _controllers.usernameController,
                  label: 'Username',
                  hintText: 'your username here',
                  textInputAction: TextInputAction.next,
                  fillColor: AppColors.lightPrimary,
                  enabledBorderColor: AppColors.lightPrimary,
                  focusedBorderColor: AppColors.primary,
                  borderRadius: SizeConfig.scaleRadius(3),
                  fontSize: 14,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a username';
                    }
                    if (value.length < 3) {
                      return 'Username must be at least 3 characters';
                    }
                    return null;
                  },
                ),
                SizedBox(height: SizeConfig.scaleHeight(2.5)),
                // Phone Number Field
                CustomTextField(
                  controller: _controllers.phoneNumberController,
                  label: 'Phone Number',
                  hintText: 'your phone number',
                  keyboardType: TextInputType.phone,
                  textInputAction: TextInputAction.next,
                  fillColor: AppColors.lightPrimary,
                  enabledBorderColor: AppColors.lightPrimary,
                  focusedBorderColor: AppColors.primary,
                  borderRadius: SizeConfig.scaleRadius(3),
                  fontSize: 14,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your phone number';
                    }
                    return null;
                  },
                ),
                SizedBox(height: SizeConfig.scaleHeight(2.5)),
                // Password Field
                CustomTextField(
                  controller: _controllers.passwordController,
                  label: 'Password',
                  hintText: 'create a password',
                  obscureText: true,
                  showObscureToggle: false,
                  textInputAction: TextInputAction.next,
                  fillColor: AppColors.lightPrimary,
                  enabledBorderColor: AppColors.lightPrimary,
                  focusedBorderColor: AppColors.primary,
                  borderRadius: SizeConfig.scaleRadius(3),
                  fontSize: 14,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a password';
                    }
                    if (value.length < 8) {
                      return 'Password must be at least 8 characters';
                    }
                    return null;
                  },
                ),
                SizedBox(height: SizeConfig.scaleHeight(2.5)),
                // Password Confirmation Field
                CustomTextField(
                  controller: _controllers.passwordConfirmationController,
                  label: 'Password confirmation',
                  hintText: 'confirm your password',
                  obscureText: true,
                  showObscureToggle: false,
                  textInputAction: TextInputAction.done,
                  fillColor: AppColors.lightPrimary,
                  enabledBorderColor: AppColors.lightPrimary,
                  focusedBorderColor: AppColors.primary,
                  borderRadius: SizeConfig.scaleRadius(3),
                  fontSize: 14,
                  onFieldSubmitted: (_) => _handleRegistration(),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please confirm your password';
                    }
                    if (value != _controllers.passwordController.text) {
                      return 'Passwords do not match';
                    }
                    return null;
                  },
                ),
                SizedBox(height: SizeConfig.scaleHeight(4)),
                // Sign Up Button
                CustomButton(
                  text: 'Sign up',
                  onPressed: _isLoading ? null : _handleRegistration,
                  expand: true,
                  backgroundColor: AppColors.primary,
                  textColor: AppColors.white,
                  borderRadius: SizeConfig.scaleRadius(3),
                  height: SizeConfig.scaleHeight(7),
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  isLoading: _isLoading,
                ),
                SizedBox(height: SizeConfig.scaleHeight(3)),
                // Already have account link
                Center(
                  child: GestureDetector(
                    onTap: () {
                      context.pop(); // Go back to login screen
                    },
                    child: CustomText(
                      'Already have an account',
                      fontSize: 14,
                      color: AppColors.primary,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                // Social Login Buttons
                const LoginSocialButtons(),
                SizedBox(height: SizeConfig.scaleHeight(4)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
