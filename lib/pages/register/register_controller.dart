import 'package:e_learning_klass/common/routes/names.dart';
import 'package:e_learning_klass/common/widgets/flutter_toast.dart';
import 'package:e_learning_klass/pages/register/bloc/register_blocs.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:e_learning_klass/common/apis/authentication_api.dart';
import 'package:e_learning_klass/common/entities/entities.dart';

class RegisterController {
  final BuildContext context;

  const RegisterController({required this.context});

  Future<void> handleEmailRegister() async {
    final state = context.read<RegisterBloc>().state;

    // Kiểm tra các trường nhập liệu
    if (state.email.isEmpty) {
      toastInfo(msg: "Email can not be empty!");
      return;
    }

    if (state.password.isEmpty) {
      toastInfo(msg: "Password can not be empty!");
      return;
    }

    if (state.rePassword.isEmpty) {
      toastInfo(msg: "Please re-enter your password!");
      return;
    } else if (state.rePassword != state.password) {
      toastInfo(msg: "Password confirmation does not match!");
      return;
    }

    if (state.phoneNumber.isEmpty) {
      toastInfo(msg: "Phone number can not be empty!");
      return;
    }

    if (state.dateOfBirth.isEmpty) {
      toastInfo(msg: "Date of birth is required!");
      return;
    }

    if (state.gender.isEmpty) {
      toastInfo(msg: "Gender is required!");
      return;
    }

    if (state.firstName.isEmpty) {
      toastInfo(msg: "First name cannot be empty!");
      return;
    }

    if (state.lastName.isEmpty) {
      toastInfo(msg: "Last name cannot be empty!");
      return;
    }

    EasyLoading.show(status: 'Registering...');

    try {
      final registerRequest = RegisterRequestEntity(
        email: state.email.trim(),
        password: state.password.trim(),
        firstName: state.firstName.trim(),
        lastName: state.lastName.trim(),
        phoneNumber: state.phoneNumber.trim(),
        dateOfBirth: state.dateOfBirth,
        gender: state.gender.trim(),
      );

      // call API register
      final result = await AuthenticationAPI.register(params: registerRequest);

      // if success navigator to login
      if (result.success == true) {
        toastInfo(msg: "Registration successful!, Please verify your email.");
        if (context.mounted) {
          Navigator.of(context)
              .pushNamedAndRemoveUntil(AppRoutes.signIn, (route) => false);
        }
      } else {
        toastInfo(msg: "Registration failed. Please try again.");
      }
    } catch (e) {
      toastInfo(msg: "An unexpected error occurred. Please try again.");
    } finally {
      EasyLoading.dismiss();
    }
  }
}
