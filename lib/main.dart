import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smartapi/constants/app_routes.dart';
import 'package:smartapi/core/services/service_locator.dart';
import 'package:smartapi/features/auth/data/repositories/auth_repositories.dart';
import 'package:smartapi/features/auth/presentation/bloc/bloc/auth_bloc.dart';
import 'package:smartapi/features/auth/presentation/screens/home_sceen.dart';
import 'package:smartapi/features/auth/presentation/screens/login_screen.dart';
import 'package:smartapi/features/auth/presentation/screens/register_screen.dart';

void main() {
  ServiceLocator.setupServiceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create:
              (context) => AuthBloc(ServiceLocator.getIt<AuthRepositories>()),
        ),
      ],
      child: MaterialApp(
        title: 'Smart API',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        initialRoute: AppRoutes.loginScreen,
        routes: {
          AppRoutes.loginScreen: (context) => LoginScreen(),
          AppRoutes.registerScreen: (context) => RegisterScreen(),
          AppRoutes.homeScreen: (context) => const HomeScreen(),
        },
      ),
    );
  }
}
