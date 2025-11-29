import 'package:flutter/material.dart';
import 'package:makers_hackathon/core/theme/app_colors.dart';
import 'package:makers_hackathon/core/widgets/custom_text.dart';
import 'package:makers_hackathon/core/widgets/size_config.dart';

class RecommendationCard extends StatelessWidget {
  final String recommendation;

  const RecommendationCard({
    super.key,
    this.recommendation = 'Irrigate your crops for 20 minutes this evening',
  });

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Container(
      width: double.infinity,
      padding: SizeConfig.allPadding(4),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(227, 242, 253, 1), // Light blue
        borderRadius: BorderRadius.circular(SizeConfig.scaleRadius(3)),
      ),
      child: Row(
        children: [
          Container(
            padding: SizeConfig.allPadding(3),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(SizeConfig.scaleRadius(2)),
            ),
            child: Icon(
              Icons.water_drop_outlined,
              color: const Color.fromRGBO(25, 118, 210, 1), // Dark blue
              size: SizeConfig.scaleText(24),
            ),
          ),
          SizedBox(width: SizeConfig.scaleWidth(4)),
          Expanded(
            child: CustomText(
              recommendation,
              fontSize: 14,
              color: AppColors.black,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

