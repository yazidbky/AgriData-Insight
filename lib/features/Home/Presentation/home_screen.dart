import 'package:flutter/material.dart';
import 'package:makers_hackathon/core/DI/dependency_injection.dart';
import 'package:makers_hackathon/core/theme/app_colors.dart';
import 'package:makers_hackathon/core/widgets/size_config.dart';
import 'package:makers_hackathon/features/Home/Presentation/widgets/nav_bar.dart';
import 'package:makers_hackathon/features/Home/Presentation/widgets/home_content.dart';
import 'package:makers_hackathon/features/Notifications/Presentation/notification_screen.dart';
import 'package:makers_hackathon/features/User/Logic/user_cubit.dart';
import 'package:makers_hackathon/features/Daily%20Tasks/Presentation/daily_tasks_screen.dart';
import 'package:makers_hackathon/features/Profile/Presentation/profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0; // Home is selected by default (index 0)
  late UserCubit _userCubit;

  @override
  void initState() {
    super.initState();
    _userCubit = getIt<UserCubit>();
    // Fetch user profile when screen loads
    _userCubit.getUserProfile();
  }

  void _onNavItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    
    // Create screens list with user cubit
    final List<Widget> screens = [
      HomeContent(userCubit: _userCubit),
      const NotificationScreen(),
      const DailyTasksScreen(),
      const ProfileScreen(),
    ];

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: screens[_currentIndex],
      bottomNavigationBar: CustomNavBar(
        currentIndex: _currentIndex,
        onTap: _onNavItemTapped,
      ),
    );
  }
}

