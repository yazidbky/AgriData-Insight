import 'package:flutter/material.dart';
import 'package:makers_hackathon/core/Helpers/Routing.dart';
import 'package:makers_hackathon/core/Helpers/regex.dart';
import 'package:makers_hackathon/core/theme/app_colors.dart';
import 'package:makers_hackathon/core/widgets/app_snack_bar.dart';
import 'package:makers_hackathon/core/widgets/custom_button.dart';
import 'package:makers_hackathon/core/widgets/custom_text.dart';
import 'package:makers_hackathon/core/widgets/custom_text_field.dart';
import 'package:makers_hackathon/core/widgets/size_config.dart';
import 'package:makers_hackathon/features/Auth/Login/Data/Models/login_request_model.dart';
import 'package:makers_hackathon/features/Auth/Login/Logic/login_cubit.dart';
import 'package:makers_hackathon/features/Auth/Login/Logic/login_state.dart';
import 'package:makers_hackathon/features/Auth/Login/Presentation/controllers/login_controllers.dart';
import 'package:makers_hackathon/features/Auth/Login/Presentation/widgets/login_logo_section.dart';
import 'package:makers_hackathon/features/Auth/Login/Presentation/widgets/login_social_buttons.dart';

class LoginScreen extends StatefulWidget {
  final LoginCubit loginCubit;

  const LoginScreen({
    super.key,
    required this.loginCubit,
  });

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late LoginControllers _controllers;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _controllers = LoginControllers();
    
    // Listen to cubit state changes
    widget.loginCubit.stream.listen((state) {
      if (mounted) {
        setState(() {
          _isLoading = state is LoginLoading;
        });

        if (state is LoginSuccess) {
          // Navigate to home screen immediately
          context.pushReplacementNamed('/home');
          
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
         
        } else if (state is LoginFailure) {
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

  void _handleLogin() {
    if (_controllers.validate()) {
      widget.loginCubit.login(
        LoginRequestModel(
          username: _controllers.email,
          password: _controllers.password,
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
                const LoginLogoSection(),
                // Email Field
                CustomTextField(
                  controller: _controllers.emailController,
                  label: 'Email',
                  hintText: 'Email',
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
                SizedBox(height: SizeConfig.scaleHeight(3)),
                // Password Field (without visibility toggle)
                CustomTextField(
                  controller: _controllers.passwordController,
                  label: 'Password',
                  hintText: 'Password',
                  obscureText: true,
                  showObscureToggle: false,
                  textInputAction: TextInputAction.done,
                  fillColor: AppColors.lightPrimary,
                  enabledBorderColor: AppColors.lightPrimary,
                  focusedBorderColor: AppColors.primary,
                  borderRadius: SizeConfig.scaleRadius(3),
                  fontSize: 14,
                  onFieldSubmitted: (_) => _handleLogin(),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                ),
                SizedBox(height: SizeConfig.scaleHeight(1)),
                // Forgot Password Link
                Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: () {
                      // Handle forgot password
                    },
                    child: CustomText(
                      'Forgot your password?',
                      fontSize: 14,
                      color: AppColors.primary,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(height: SizeConfig.scaleHeight(4)),
                // Sign In Button
                CustomButton(
                  text: 'Sign in',
                  onPressed: _isLoading ? null : _handleLogin,
                  expand: true,
                  backgroundColor:_isLoading ? AppColors.grey300 : AppColors.primary,
                  textColor: AppColors.white,
                  borderRadius: SizeConfig.scaleRadius(3),
                  height: SizeConfig.scaleHeight(7),
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  isLoading: _isLoading,
                ),
                SizedBox(height: SizeConfig.scaleHeight(3)),
                // Create Account Link
                Center(
                  child: GestureDetector(
                    onTap: () {
                      context.pushNamed('/registration');
                    },
                    child: CustomText(
                      'Create new account',
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

