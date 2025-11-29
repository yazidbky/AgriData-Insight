import 'package:flutter/material.dart';
import 'package:makers_hackathon/core/theme/app_colors.dart';
import 'package:makers_hackathon/core/widgets/custom_text.dart';
import 'package:makers_hackathon/core/widgets/size_config.dart';

class CustomNavBar extends StatefulWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  State<CustomNavBar> createState() => _CustomNavBarState();
}

class _CustomNavBarState extends State<CustomNavBar> {
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(SizeConfig.scaleRadius(5)),
          topRight: Radius.circular(SizeConfig.scaleRadius(5)),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: SizeConfig.scaleWidth(2.5),
            offset: Offset(0, -SizeConfig.scaleHeight(0.25)),
          ),
        ],
      ),
      child: SafeArea(
        child: Padding(
          padding: SizeConfig.scalePadding(
            horizontal: 4,
            vertical: 2,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNavItem(
                icon: Icons.home_outlined,
                label: 'Home',
                index: 0,
              ),
              _buildNavItem(
                icon: Icons.notifications_outlined,
                label: 'Notification',
                index: 1,
              ),
              _buildNavItem(
                icon: Icons.task_outlined,
                label: 'Tasks',
                index: 2,
              ),
              _buildNavItem(
                icon: Icons.person_outline,
                label: 'Profile',
                index: 3,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem({
    required IconData icon,
    required String label,
    required int index,
  }) {
    final isActive = widget.currentIndex == index;

    return Expanded(
      child: GestureDetector(
        onTap: () => widget.onTap(index),
        child: Container(
          margin: SizeConfig.scalePadding(horizontal: 1),
          padding: SizeConfig.scalePadding(
            vertical: 2,
            horizontal: 3,
          ),
          decoration: BoxDecoration(
            color: isActive ? AppColors.primary : AppColors.transparent,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(SizeConfig.scaleRadius(3)),
              topRight: isActive
                  ? Radius.circular(SizeConfig.scaleRadius(3))
                  : Radius.zero,
              bottomLeft: Radius.circular(SizeConfig.scaleRadius(3)),
              bottomRight: isActive
                  ? Radius.circular(SizeConfig.scaleRadius(3))
                  : Radius.zero,
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon,
                color: isActive ? AppColors.white : AppColors.primary,
                size: SizeConfig.scaleText(24),
              ),
              SizedBox(height: SizeConfig.scaleHeight(0.5)),
              CustomText(
                label,
                fontSize: 12,
                color: isActive ? AppColors.white : AppColors.primary,
                fontWeight: isActive ? FontWeight.w600 : FontWeight.normal,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

