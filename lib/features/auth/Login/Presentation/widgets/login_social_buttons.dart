import 'package:flutter/material.dart';
import 'package:makers_hackathon/core/theme/app_colors.dart';
import 'package:makers_hackathon/core/widgets/custom_text.dart';
import 'package:makers_hackathon/core/widgets/size_config.dart';

class LoginSocialButtons extends StatelessWidget {
  final VoidCallback? onGooglePressed;
  final VoidCallback? onFacebookPressed;
  final VoidCallback? onApplePressed;

  const LoginSocialButtons({
    super.key,
    this.onGooglePressed,
    this.onFacebookPressed,
    this.onApplePressed,
  });

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Column(
      children: [
        SizedBox(height: SizeConfig.scaleHeight(4)),
        Row(
          children: [
            Expanded(
              child: Divider(
                color: AppColors.grey300,
                thickness: 1,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: SizeConfig.scaleWidth(4)),
              child: CustomText(
                'Or continue with',
                fontSize: 14,
                color: AppColors.primary,
              ),
            ),
            Expanded(
              child: Divider(
                color: AppColors.grey300,
                thickness: 1,
              ),
            ),
          ],
        ),
        SizedBox(height: SizeConfig.scaleHeight(4)),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Google Button
            _buildSocialButton(
              'G',
              onGooglePressed ?? () {},
            ),
            SizedBox(width: SizeConfig.scaleWidth(4)),
            // Facebook Button
            _buildSocialButton(
              'f',
              onFacebookPressed ?? () {},
            ),
            SizedBox(width: SizeConfig.scaleWidth(4)),
            // Apple Button
            _buildSocialButton(
              '🍎',
              onApplePressed ?? () {},
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSocialButton(String text, VoidCallback onPressed) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: SizeConfig.scaleWidth(15),
        height: SizeConfig.scaleWidth(15),
        decoration: BoxDecoration(
          color: AppColors.grey100,
          borderRadius: BorderRadius.circular(SizeConfig.scaleRadius(3)),
        ),
        child: Center(
          child: CustomText(
            text,
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: AppColors.black,
          ),
        ),
      ),
    );
  }
}

