import 'package:e_learning_klass/pages/register/bloc/register_blocs.dart';
import 'package:e_learning_klass/pages/sign_in/bloc/signin_blocs.dart';
import 'package:e_learning_klass/pages/welcome/bloc/welcome_blocs.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppBlocProviders {
  static get allBlocProviders => [
        BlocProvider(
          create: (context) => WelcomeBloc(),
        ),
        BlocProvider(
          create: (context) => SignInBloc(),
        ),
        BlocProvider(
          create: (context) => RegisterBloc(),
        )
      ];
}
