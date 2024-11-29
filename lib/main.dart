import 'package:e_learning_klass/common/routes/routes.dart';
import 'package:e_learning_klass/global.dart';
import 'package:e_learning_klass/pages/all_students/all_students.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<void> main() async {
  await Global.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [...AppPages.allBlocProviders(context)],
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (context, child) => MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            appBarTheme: const AppBarTheme(
              elevation: 0,
              backgroundColor: Colors.white,
            ),
          ),
          onGenerateRoute: AppPages.generateRouteSettings,
        ),
      ),
    );
  }
}
