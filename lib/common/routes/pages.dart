import 'package:e_learning_klass/common/routes/names.dart';
import 'package:e_learning_klass/global.dart';
import 'package:e_learning_klass/pages/all_students/all_students.dart';
import 'package:e_learning_klass/pages/all_students/bloc/all_students_blocs.dart';
import 'package:e_learning_klass/pages/application/application_page.dart';
import 'package:e_learning_klass/pages/application/bloc/app_blocs.dart';
import 'package:e_learning_klass/pages/class_detail/bloc/class_detail_blocs.dart';
import 'package:e_learning_klass/pages/class_detail/class_detail.dart';
import 'package:e_learning_klass/pages/class_today/bloc/class_today_blocs.dart';
import 'package:e_learning_klass/pages/class_today/class_today.dart';
import 'package:e_learning_klass/pages/classes/bloc/classes_blocs.dart';
import 'package:e_learning_klass/pages/classes/classes.dart';
import 'package:e_learning_klass/pages/register/bloc/register_blocs.dart';
import 'package:e_learning_klass/pages/register/register.dart';
import 'package:e_learning_klass/pages/sign_in/bloc/signin_blocs.dart';
import 'package:e_learning_klass/pages/sign_in/sign_in.dart';
import 'package:e_learning_klass/pages/welcome/bloc/welcome_blocs.dart';
import 'package:e_learning_klass/pages/welcome/welcome.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppPages {
  static List<PageEntity> routes() {
    return [
      PageEntity(
        route: AppRoutes.initial,
        page: const Welcome(),
        bloc: BlocProvider(
          create: (_) => WelcomeBloc(),
        ),
      ),
      PageEntity(
        route: AppRoutes.signIn,
        page: const SignIn(),
        bloc: BlocProvider(
          create: (_) => SignInBloc(),
        ),
      ),
      PageEntity(
        route: AppRoutes.register,
        page: const Register(),
        bloc: BlocProvider(
          create: (_) => RegisterBloc(),
        ),
      ),
      PageEntity(
        route: AppRoutes.application,
        page: const ApplicationPage(),
        bloc: BlocProvider(
          create: (_) => AppBloc(),
        ),
      ),
      PageEntity(
        route: AppRoutes.allStudents,
        page: const AllStudents(),
        bloc: BlocProvider(
          create: (_) => AllStudentsBlocs(),
        ),
      ),
      PageEntity(
        route: AppRoutes.classDetail,
        page: const ClassDetail(),
        bloc: BlocProvider(
          create: (_) => ClassDetailBlocs(),
        ),
      ),
      PageEntity(
        route: AppRoutes.allClasses,
        page: const Classes(),
        bloc: BlocProvider(
          create: (_) => ClassesBlocs(),
        ),
      ),
      PageEntity(
        route: AppRoutes.classToday,
        page: const ClassToday(),
        bloc: BlocProvider(
          create: (_) => ClassTodayBlocs(),
        ),
      )
    ];
  }

  //return all the bloc providers
  static List<dynamic> allBlocProviders(BuildContext context) {
    List<dynamic> blocProviders = <dynamic>[];
    for (var bloc in routes()) {
      blocProviders.add(bloc.bloc);
    }
    return blocProviders;
  }

  //a model that covers entire screen as we click on navigator object
  static MaterialPageRoute generateRouteSettings(RouteSettings settings) {
    if (settings.name != null) {
      //check for route name matching when navigator gets triggered
      var result = routes().where((element) => element.route == settings.name);
      if (result.isNotEmpty) {
        bool deviceFirstOpen = Global.storageService.getDeviceFirstOpen();

        if (result.first.route == AppRoutes.initial && deviceFirstOpen) {
          bool isLoggedIn = Global.storageService.getIsLoggedIn();
          print("the user have loggin : $isLoggedIn");
          if (isLoggedIn) {
            return MaterialPageRoute(
                builder: (_) => const ApplicationPage(), settings: settings);
          }
          return MaterialPageRoute(
              builder: (_) => const SignIn(), settings: settings);
        }
        return MaterialPageRoute(
            builder: (_) => result.first.page, settings: settings);
      }
    }
    return MaterialPageRoute(
        builder: (_) => const SignIn(), settings: settings);
  }
}

//unify BlocProvider and routes and pages
class PageEntity {
  String route;
  Widget page;
  dynamic bloc;

  PageEntity({required this.route, required this.page, required this.bloc});
}
