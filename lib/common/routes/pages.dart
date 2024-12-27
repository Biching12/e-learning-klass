import 'package:e_learning_klass/common/routes/names.dart';
import 'package:e_learning_klass/pages/exam_overview/bloc/exam_overview_bloc.dart';
import 'package:e_learning_klass/pages/exam_overview/exam_overview.dart';
import 'package:e_learning_klass/global.dart';
import 'package:e_learning_klass/pages/all_students/all_students.dart';
import 'package:e_learning_klass/pages/all_students/bloc/all_students_blocs.dart';
import 'package:e_learning_klass/pages/all_teachers/all_teachers.dart';
import 'package:e_learning_klass/pages/all_teachers/bloc/all_teachers_blocs.dart';
import 'package:e_learning_klass/pages/application/application_page.dart';
import 'package:e_learning_klass/pages/application/bloc/app_blocs.dart';
import 'package:e_learning_klass/pages/class_detail/bloc/class_detail_blocs.dart';
import 'package:e_learning_klass/pages/class_detail/class_detail.dart';
import 'package:e_learning_klass/pages/class_today/bloc/class_today_blocs.dart';
import 'package:e_learning_klass/pages/class_today/class_today.dart';
import 'package:e_learning_klass/pages/classes/bloc/classes_blocs.dart';
import 'package:e_learning_klass/pages/classes/classes.dart';
import 'package:e_learning_klass/pages/exam_lesson/bloc/exam_lesson_bloc.dart';
import 'package:e_learning_klass/pages/exam_lesson/exam_lesson.dart';

import 'package:e_learning_klass/pages/home/bloc/home_page_bloc.dart';
import 'package:e_learning_klass/pages/home/home_page.dart';
import 'package:e_learning_klass/pages/register/bloc/register_blocs.dart';
import 'package:e_learning_klass/pages/register/register.dart';
import 'package:e_learning_klass/pages/school_schedule/bloc/school_schedule_blocs.dart';
import 'package:e_learning_klass/pages/school_schedule/school_schedule.dart';
import 'package:e_learning_klass/pages/sign_in/bloc/signin_blocs.dart';
import 'package:e_learning_klass/pages/sign_in/sign_in.dart';
import 'package:e_learning_klass/pages/tools/bloc/tools_bloc.dart';
import 'package:e_learning_klass/pages/tools/tools.dart';
import 'package:e_learning_klass/pages/tuition_student/bloc/tuition_student_bloc.dart';
import 'package:e_learning_klass/pages/tuition_student/tuition_student.dart';
import 'package:e_learning_klass/pages/tuition_teacher/bloc/tuition_teacher_bloc.dart';
import 'package:e_learning_klass/pages/tuition_teacher/tuition_teacher.dart';
import 'package:e_learning_klass/pages/welcome/bloc/welcome_blocs.dart';
import 'package:e_learning_klass/pages/welcome/welcome.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppPages {
  static List<PageEntity> routes() {
    return [
      //Router for first screen
      PageEntity(
        route: AppRoutes.initial,
        page: const Welcome(),
        bloc: BlocProvider(
          create: (_) => WelcomeBloc(),
        ),
      ),
      //Router for sign in screen
      PageEntity(
        route: AppRoutes.signIn,
        page: const SignIn(),
        bloc: BlocProvider(
          create: (_) => SignInBloc(),
        ),
      ),
      //Router for register screen
      PageEntity(
        route: AppRoutes.register,
        page: const Register(),
        bloc: BlocProvider(
          create: (_) => RegisterBloc(),
        ),
      ),
      //Router for application
      PageEntity(
        route: AppRoutes.application,
        page: const ApplicationPage(),
        bloc: BlocProvider(
          create: (_) => AppBloc(),
        ),
      ),
      //Router for all students screen
      PageEntity(
        route: AppRoutes.allStudents,
        page: const AllStudents(),
        bloc: BlocProvider(
          create: (_) => AllStudentsBlocs(),
        ),
      ),
      //Router for class detail screen
      PageEntity(
        route: AppRoutes.classDetail,
        page: const ClassDetail(),
        bloc: BlocProvider(
          create: (_) => ClassDetailBlocs(),
        ),
      ),
      //Router for all classes screen
      PageEntity(
        route: AppRoutes.allClasses,
        page: const Classes(),
        bloc: BlocProvider(
          create: (_) => ClassesBlocs(),
        ),
      ),
      //Router for class today
      PageEntity(
        route: AppRoutes.classToday,
        page: const ClassToday(),
        bloc: BlocProvider(
          create: (_) => ClassTodayBlocs(),
        ),
      ),
      // Router for all teachers
      PageEntity(
        route: AppRoutes.allTeachers,
        page: const AllTeachers(),
        bloc: BlocProvider(
          create: (_) => AllTeachersBlocs(),
        ),
      ),
      // Router for school schedule
      PageEntity(
        route: AppRoutes.schoolSchedule,
        page: const SchoolSchedule(),
        bloc: BlocProvider(
          create: (_) => SchoolScheduleBlocs(),
        ),
      ),
      //Router for home page
      PageEntity(
        route: AppRoutes.homePage,
        page: const HomePage(),
        bloc: BlocProvider(
          create: (_) => HomePageBloc(),
        ),
      ),
      PageEntity(
        route: AppRoutes.examLesson,
        page: const ExamLesson(),
        bloc: BlocProvider(
          create: (_) => ExamLessonBloc(),
        ),
      ),
      PageEntity(
        route: AppRoutes.examOverview,
        page: const ExamOverview(),
        bloc: BlocProvider(
          create: (_) => ExamOverviewBloc(),
        ),
      ),
      PageEntity(
        route: AppRoutes.tools,
        page: const Tools(),
        bloc: BlocProvider(
          create: (_) => ToolsBloc(),
        ),
      ),
      PageEntity(
        route: AppRoutes.tuitionTeacher,
        page: const TuitionTeacher(),
        bloc: BlocProvider(
          create: (_) => TuitionTeacherBloc(),
        ),
      ),
      PageEntity(
        route: AppRoutes.tuitionStudent,
        page: const TuitionStudent(),
        bloc: BlocProvider(
          create: (_) => TuitionStudentBloc(),
        ),
      ),
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

          // print("the user have loggin : $isLoggedIn");
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
