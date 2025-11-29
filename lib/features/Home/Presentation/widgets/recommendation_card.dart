import 'package:flutter/material.dart';
import 'package:makers_hackathon/core/theme/app_colors.dart';
import 'package:makers_hackathon/core/widgets/custom_text.dart';
import 'package:makers_hackathon/core/widgets/size_config.dart';

class RecommendationCard extends StatelessWidget {
  final String cropName;
  final double similarityPercentage;
  final String? growingSeason;
  final String? waterRequirement;
  final int? rank;

  const RecommendationCard({
    super.key,
    required this.cropName,
    required this.similarityPercentage,
    this.growingSeason,
    this.waterRequirement,
    this.rank,
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
              Icons.eco_outlined,
              color: AppColors.primary,
              size: SizeConfig.scaleText(24),
            ),
          ),
          SizedBox(width: SizeConfig.scaleWidth(4)),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    if (rank != null) ...[
                      Container(
                        padding: SizeConfig.scalePadding(horizontal: 2, vertical: 0.5),
                        decoration: BoxDecoration(
                          color: AppColors.primary,
                          borderRadius: BorderRadius.circular(SizeConfig.scaleRadius(1)),
                        ),
                        child: CustomText(
                          '#$rank',
                          fontSize: 12,
                          color: AppColors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(width: SizeConfig.scaleWidth(2)),
                    ],
                    Expanded(
                      child: CustomText(
                        cropName,
                        fontSize: 16,
                        color: AppColors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: SizeConfig.scaleHeight(0.5)),
                CustomText(
                  '${similarityPercentage.toStringAsFixed(1)}% match',
                  fontSize: 14,
                  color: AppColors.primary,
                  fontWeight: FontWeight.w500,
                ),
                if (growingSeason != null || waterRequirement != null) ...[
                  SizedBox(height: SizeConfig.scaleHeight(0.5)),
                  CustomText(
                    [
                      if (growingSeason != null) growingSeason,
                      if (waterRequirement != null) '$waterRequirement water',
                    ].join(' • '),
                    fontSize: 12,
                    color: AppColors.grey600,
                    fontWeight: FontWeight.w400,
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}

