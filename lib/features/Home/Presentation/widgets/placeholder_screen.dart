import 'package:flutter/material.dart';
import 'package:makers_hackathon/core/theme/app_colors.dart';
import 'package:makers_hackathon/core/widgets/custom_text.dart';
import 'package:makers_hackathon/core/widgets/size_config.dart';

class PlaceholderScreen extends StatelessWidget {
  final String title;

  const PlaceholderScreen({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                _getIconForTitle(title),
                size: SizeConfig.scaleText(64),
                color: AppColors.primary,
              ),
              SizedBox(height: SizeConfig.scaleHeight(2)),
              CustomText(
                title,
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: AppColors.primary,
              ),
              SizedBox(height: SizeConfig.scaleHeight(1)),
              CustomText(
                'Placeholder Screen',
                fontSize: 16,
                color: AppColors.grey600,
              ),
            ],
          ),
        ),
      ),
    );
  }

  IconData _getIconForTitle(String title) {
    switch (title) {
      case 'Profile':
        return Icons.person_outline;
      case 'Tasks':
        return Icons.task_outlined;
      case 'Notification':
        return Icons.notifications_outlined;
      default:
        return Icons.help_outline;
    }
  }
}

