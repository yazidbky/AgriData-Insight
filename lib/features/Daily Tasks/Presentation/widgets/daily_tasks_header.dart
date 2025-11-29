import 'package:flutter/material.dart';
import 'package:makers_hackathon/core/theme/app_colors.dart';
import 'package:makers_hackathon/core/widgets/custom_text.dart';
import 'package:makers_hackathon/core/widgets/size_config.dart';
import 'package:makers_hackathon/features/Home/Presentation/widgets/logo_widget.dart';

class DailyTasksHeader extends StatelessWidget {
  const DailyTasksHeader({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);

    return Padding(
      padding: SizeConfig.scalePadding(horizontal: 4, vertical: 2),
      child: Row(
        children: [
          // Logo
          const LogoWidget(
            width: 15,
            height: 15,
          ),
          SizedBox(width: SizeConfig.scaleWidth(4)),
          // Title
          const CustomText(
            'Daily tasks',
            fontSize: 22,
            fontWeight: FontWeight.w600,
            color: AppColors.black,
          ),
        ],
      ),
    );
  }
}

