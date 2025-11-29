import 'package:flutter/material.dart';
import 'package:makers_hackathon/core/theme/app_colors.dart';
import 'package:makers_hackathon/core/widgets/custom_text.dart';
import 'package:makers_hackathon/core/widgets/size_config.dart';
import 'package:makers_hackathon/features/Home/Presentation/widgets/logo_widget.dart';

class HomeHeader extends StatelessWidget {
  final String userName;

  const HomeHeader({
    super.key,
    this.userName = 'Farmer',
  });

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Padding(
      padding: SizeConfig.scalePadding(
        horizontal: 4,
        vertical: 4,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: SizeConfig.scaleWidth(12.5),
                height: SizeConfig.scaleWidth(12.5),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.grey300,
                  border: Border.all(
                    color: AppColors.primary,
                    width: SizeConfig.scaleWidth(0.5),
                  ),
                ),
                child: Icon(
                  Icons.person,
                  color: AppColors.grey600,
                  size: SizeConfig.scaleText(30),
                ),
              ),
              SizedBox(width: SizeConfig.scaleWidth(3)),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    'Welcome back,',
                    fontSize: 14,
                    color: AppColors.grey600,
                    fontWeight: FontWeight.w400,
                  ),
                  CustomText(
                    '$userName...',
                    fontSize: 18,
                    color: AppColors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ],
              ),
            ],
          ),
          const LogoWidget(),
        ],
      ),
    );
  }
}

