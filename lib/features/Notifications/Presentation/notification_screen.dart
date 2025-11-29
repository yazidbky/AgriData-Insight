import 'package:flutter/material.dart';
import 'package:makers_hackathon/core/constants/app_assets.dart';
import 'package:makers_hackathon/core/theme/app_colors.dart';
import 'package:makers_hackathon/core/widgets/custom_text.dart';
import 'package:makers_hackathon/core/widgets/size_config.dart';
import 'package:makers_hackathon/features/Home/Presentation/widgets/logo_widget.dart';
import 'package:makers_hackathon/features/Home/Presentation/widgets/notification_card.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: SizeConfig.scalePadding(
              horizontal: 4,
              vertical: 4,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Logo and Title
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const LogoWidget(),
                    CustomText(
                      'NOTIFICATIONS',
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: AppColors.black,
                    ),
                    SizedBox(width: SizeConfig.scaleWidth(12)), // Spacer for balance
                  ],
                ),
                SizedBox(height: SizeConfig.scaleHeight(3)),
                
                // Notification Cards
                NotificationCard(
                  iconAsset: AppAssets.irrigationAlert,
                  title: 'Irrigation Alert',
                  subtitle: 'soil moisture is low in sector 3 immediate irrigation required',
                ),
                NotificationCard(
                  iconAsset: AppAssets.temperatureAlert,
                  title: 'Temperature warning',
                  subtitle: 'soil moisture is low in sector 3 immediate irrigation required',
                ),
                NotificationCard(
                  iconAsset: AppAssets.rainfallAlert,
                  title: 'Rainfall update',
                  subtitle: 'soil moisture is low in sector 3 immediate irrigation required',
                ),
                NotificationCard(
                  iconAsset: AppAssets.windyWeatherAlert,
                  title: 'Wind Advisory',
                  subtitle: 'soil moisture is low in sector 3 immediate irrigation required',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
