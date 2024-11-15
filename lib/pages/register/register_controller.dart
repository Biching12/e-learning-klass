import 'package:e_learning_klass/common/widgets/flutter_toast.dart';
import 'package:e_learning_klass/pages/register/bloc/register_blocs.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterController {
  final BuildContext context;
  const RegisterController({required this.context});

  void handleEmailRegister() {
    final state = context.read<RegisterBloc>().state;
    String userName = state.userName;
    String email = state.email;
    String password = state.password;
    String rePassword = state.rePassword;

    if (userName.isEmpty) {
      toastInfo(msg: "User name can not be emty!");
      return;
    }

    if (email.isEmpty) {
      toastInfo(msg: "Email can not be emty!");
      return;
    }

    if (password.isEmpty) {
      toastInfo(msg: "Password can not be emty!");
      return;
    }

    if (rePassword.isEmpty) {
      toastInfo(msg: "Please re-enter your password");
      return;
    } else if (rePassword != password) {
      toastInfo(msg: "Your password confirmation is wrong!");
      return;
    }
  }
}
