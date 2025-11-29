import 'package:flutter/material.dart';
import 'package:makers_hackathon/core/theme/app_colors.dart';
import 'package:makers_hackathon/core/widgets/size_config.dart';

class ProfileAvatar extends StatelessWidget {
  final String? imageUrl;
  final double size;
  final VoidCallback? onEditTap;
  final bool showBadge;

  const ProfileAvatar({
    super.key,
    this.imageUrl,
    this.size = 30,
    this.onEditTap,
    this.showBadge = true,
  });

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);

    return Stack(
      children: [
        // Gradient background circle
        Container(
          width: SizeConfig.scaleWidth(size),
          height: SizeConfig.scaleWidth(size),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                const Color(0xFFE8B4B4).withOpacity(0.8),
                const Color(0xFFD4A5A5).withOpacity(0.6),
              ],
            ),
          ),
          child: ClipOval(
            child: imageUrl != null && imageUrl!.isNotEmpty
                ? Image.network(
                    imageUrl!,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return _buildPlaceholder();
                    },
                  )
                : _buildPlaceholder(),
          ),
        ),
        // Edit badge
        if (showBadge)
          Positioned(
            bottom: SizeConfig.scaleWidth(1),
            right: SizeConfig.scaleWidth(1),
            child: GestureDetector(
              onTap: onEditTap,
              child: Container(
                width: SizeConfig.scaleWidth(7),
                height: SizeConfig.scaleWidth(7),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: AppColors.primary,
                    width: 1.5,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Icon(
                  Icons.edit_outlined,
                  size: SizeConfig.scaleWidth(4),
                  color: AppColors.primary,
                ),
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildPlaceholder() {
    return Container(
      color: AppColors.grey200,
      child: Icon(
        Icons.person,
        size: SizeConfig.scaleWidth(size * 0.5),
        color: AppColors.grey400,
      ),
    );
  }
}

