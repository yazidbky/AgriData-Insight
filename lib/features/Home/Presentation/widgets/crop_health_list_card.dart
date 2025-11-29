import 'package:flutter/material.dart';
import 'package:makers_hackathon/core/constants/app_assets.dart';
import 'package:makers_hackathon/core/theme/app_colors.dart';
import 'package:makers_hackathon/core/widgets/build_icon.dart';
import 'package:makers_hackathon/core/widgets/custom_text.dart';
import 'package:makers_hackathon/core/widgets/size_config.dart';

class CropHealthListCard extends StatelessWidget {
  final String status;

  const CropHealthListCard({
    super.key,
    this.status = 'Needs Attention',
  });

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Container(
      width: double.infinity,
      padding: SizeConfig.allPadding(4),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(255, 243, 224, 1), // Light orange
        borderRadius: BorderRadius.circular(SizeConfig.scaleRadius(3)),
      ),
      child: ListTile(
        contentPadding: SizeConfig.scalePadding(
          horizontal: 2,
          vertical: 0,
        ),
        leading: buildIcon(
          AppAssets.orangeLeaf,
          8,
          8,
        ),
        title: CustomText(
          'Crop healthy',
          fontSize: 14,
          color: AppColors.grey600,
          fontWeight: FontWeight.w400,
        ),
        subtitle: Padding(
          padding: EdgeInsets.only(top: SizeConfig.scaleHeight(0.3)),
          child: CustomText(
            status,
            fontSize: 20,
            color: AppColors.error, // Red for "Needs Attention"
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}

