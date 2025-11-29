import 'package:flutter/material.dart';
import 'package:makers_hackathon/core/theme/app_colors.dart';
import 'package:makers_hackathon/core/widgets/app_snack_bar.dart';
import 'package:makers_hackathon/core/widgets/confirmation_dialog.dart';
import 'package:makers_hackathon/core/widgets/size_config.dart';
import 'package:makers_hackathon/features/Profile/Presentation/widgets/profile_header.dart';
import 'package:makers_hackathon/features/Profile/Presentation/widgets/profile_menu_item.dart';
import 'package:makers_hackathon/features/Profile/Presentation/widgets/profile_section.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  void _showAddLandDialog(BuildContext context) {
    ConfirmationDialog.show(
      context,
      title: 'Add New Land',
      description: 'Are you sure you want to add a new land to your profile? This will help you manage multiple farming areas.',
      icon: Icons.add_location_alt_outlined,
      confirmText: 'Add Land',
      cancelText: 'Cancel',
      type: DialogType.info,
      onConfirm: () {
        showAppSnackBar(
          context: context,
          message: 'New land added successfully!',
          icon: Icons.check_circle_outline,
          backgroundColor: AppColors.primary,
          behavior: SnackBarBehavior.floating,
        );
      },
    );
  }

  void _handleLogout(BuildContext context) {
    ConfirmationDialog.showDanger(
      context,
      title: 'Logout',
      description: 'Are you sure you want to logout? You will need to sign in again to access your account.',
      icon: Icons.logout,
      confirmText: 'Logout',
      cancelText: 'Cancel',
      onConfirm: () {
        // Navigate to login screen
        Navigator.of(context).pushNamedAndRemoveUntil(
          '/login',
          (route) => false,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Profile header with avatar
              const ProfileHeader(
                userName: 'Yazid',
                location: 'msila,alger',
                imageUrl: null, // Replace with actual image URL
              ),
              SizedBox(height: SizeConfig.scaleHeight(4)),

              // Account section
              ProfileSection(
                title: 'Account',
                children: [
                  ProfileMenuItem(
                    icon: Icons.add_circle_outline,
                    title: 'Add New Land',
                    onTap: () => _showAddLandDialog(context),
                  ),
                  ProfileMenuItem(
                    icon: Icons.person_outline,
                    title: 'Edit profile',
                    onTap: () {
                      // Navigate to edit profile
                    },
                  ),
                  ProfileMenuItem(
                    icon: Icons.history,
                    title: 'History',
                    onTap: () {
                      // Navigate to history
                    },
                  ),
                  ProfileMenuItem(
                    icon: Icons.lock_outline,
                    title: 'Privacy',
                    onTap: () {
                      // Navigate to privacy settings
                    },
                    showDivider: false,
                  ),
                ],
              ),
              SizedBox(height: SizeConfig.scaleHeight(3)),

              // Actions section
              ProfileSection(
                title: 'Actions',
                children: [
                  ProfileMenuItem(
                    icon: Icons.flag_outlined,
                    title: 'Report a problem',
                    onTap: () {
                      // Navigate to report problem
                    },
                  ),
                  ProfileMenuItem(
                    icon: Icons.logout,
                    title: 'Log out',
                    iconColor: AppColors.error,
                    onTap: () => _handleLogout(context),
                    showDivider: false,
                  ),
                ],
              ),
              SizedBox(height: SizeConfig.scaleHeight(4)),
            ],
          ),
        ),
      ),
    );
  }
}

