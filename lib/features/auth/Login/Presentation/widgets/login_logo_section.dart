import 'package:flutter/material.dart';
import 'package:makers_hackathon/core/theme/app_colors.dart';
import 'package:makers_hackathon/core/widgets/custom_text.dart';
import 'package:makers_hackathon/core/widgets/size_config.dart';
import 'package:makers_hackathon/features/Home/Presentation/widgets/logo_widget.dart';

class LoginLogoSection extends StatelessWidget {
  const LoginLogoSection({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Column(
      children: [
        SizedBox(height: SizeConfig.scaleHeight(8)),
        const LogoWidget(width: 40, height: 40),
       
       
        SizedBox(height: SizeConfig.scaleHeight(4)),
        CustomText(
          'Welcome back you\'ve been missed!',
          fontSize: 16,
          color: AppColors.grey600,
          textAlign: TextAlign.center,
        ),
        SizedBox(height: SizeConfig.scaleHeight(6)),
      ],
    );
  }
}

