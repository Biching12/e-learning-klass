import 'package:e_learning_klass/pages/application/application_page.dart';
import 'package:e_learning_klass/pages/bloc_providers.dart';
import 'package:e_learning_klass/pages/register/register.dart';
import 'package:e_learning_klass/pages/sign_in/sign_in.dart';
import 'package:e_learning_klass/pages/welcome/welcome.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: AppBlocProviders.allBlocProviders,
      child: ScreenUtilInit(
        builder: (context, child) => MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            appBarTheme: const AppBarTheme(
              elevation: 0,
              backgroundColor: Colors.white,
            ),
          ),
          home: const ApplicationPage(),
          routes: {
            "myHomePage": (context) => const Welcome(),
            "signIn": (context) => const SignIn(),
            "register": (context) => const Register(),
          },
        ),
      ),
    );
  }
}
