import 'package:e_learning_klass/common/apis/user_api.dart';
import 'package:e_learning_klass/common/entities/entities.dart';
import 'package:e_learning_klass/common/values/constant.dart';
import 'package:e_learning_klass/common/widgets/flutter_toast.dart';
import 'package:e_learning_klass/global.dart';
import 'package:e_learning_klass/pages/sign_in/bloc/signin_blocs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class SignInController {
  final BuildContext context;
  const SignInController({required this.context});

  void handleSignIn(String type) {
    try {
      if (type == "email") {
        BlocProvider.of<SignInBloc>(context).state;
        final state = context.read<SignInBloc>().state;
        String emailAddress = state.email;
        String password = state.password;
        if (emailAddress.isEmpty) {
          //
          toastInfo(msg: "You need to fill email address");
          return;
        }
        if (password.isEmpty) {
          toastInfo(msg: "You need to fill password");
          return;
        }
        if (emailAddress.isNotEmpty && password.isNotEmpty) {
          Global.storageService
              .setString(AppConstants.STORAGE_USER_TOKEN_KEY, "123456");
          Navigator.of(context)
              .pushNamedAndRemoveUntil("/application", (route) => false);
        }
      }
    } catch (e) {}
  }

  void asyncPostAllData(LoginRequestEntity loginRequestEntity) async {
    EasyLoading.show(
      indicator: const CircularProgressIndicator(),
      maskType: EasyLoadingMaskType.clear,
      dismissOnTap: true,
    );
    var result = await UserAPI.login(params: loginRequestEntity);
  }
}
