import 'package:flutter/material.dart';
import 'package:makers_hackathon/core/DI/dependency_injection.dart';
import 'package:makers_hackathon/core/widgets/size_config.dart';
import 'package:makers_hackathon/features/Auth/Login/Logic/login_cubit.dart';
import 'package:makers_hackathon/features/Auth/Login/Presentation/login_screen.dart';
import 'package:makers_hackathon/features/Auth/Registation/Logic/registration_cubit.dart';
import 'package:makers_hackathon/features/Auth/Registation/Presentation/registration_screen.dart';
import 'package:makers_hackathon/features/Home/Presentation/home_screen.dart';

void main() {
  setupDependencyInjection();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Farmers App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      builder: (context, child) {
        SizeConfig.init(context);
        return child ?? const SizedBox();
      },
      initialRoute: '/login',
      routes: {
        '/login': (context) => LoginScreen(loginCubit: getIt<LoginCubit>()),
        '/registration': (context) => RegistrationScreen(registrationCubit: getIt<RegistrationCubit>()),
        '/home': (context) => const HomeScreen(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
