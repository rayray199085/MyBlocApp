import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_bloc_app/blocs/authentication/authentication_cubit.dart';
import 'package:my_bloc_app/pages/home/home.dart';
import 'package:my_bloc_app/pages/login/login.dart';

class MyBlocApp extends StatelessWidget {
  const MyBlocApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const primaryColor = Colors.lightGreen;
    return BlocProvider(
      create: (context) => AuthenticationCubit(),
      child: MaterialApp(
        title: 'MyBlocApp',
        theme: ThemeData.light().copyWith(
          colorScheme:
              const ColorScheme.light().copyWith(primary: primaryColor),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 15),
            ),
          ),
          inputDecorationTheme: const InputDecorationTheme(
            border: OutlineInputBorder(),
          ),
        ),
        routes: {
          '/login': (context) => const LoginView(),
          '/home': (context) => const HomeView(),
        },
        home: const LoginView(),
      ),
    );
  }
}
