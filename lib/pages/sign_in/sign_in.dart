import 'package:e_learning_klass/common/routes/names.dart';
import 'package:e_learning_klass/pages/sign_in/bloc/signin_blocs.dart';
import 'package:e_learning_klass/pages/sign_in/bloc/signin_events.dart';
import 'package:e_learning_klass/pages/sign_in/bloc/signin_states.dart';
import 'package:e_learning_klass/pages/sign_in/sign_in_controller.dart';
import 'package:e_learning_klass/pages/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInBloc, SigninState>(
      builder: (context, state) {
        return Container(
          color: Colors.white,
          child: SafeArea(
            child: Scaffold(
              backgroundColor: Colors.white,
              appBar: buildAppBar("Login"),
              body: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildTwoPartyLogin(context),
                    Center(
                        child:
                            reusableText("Or use your email account to login")),
                    Container(
                      margin: EdgeInsets.only(top: 20.h),
                      padding: EdgeInsets.only(left: 25.w, right: 25.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          reusableText("Email"),
                          SizedBox(
                            height: 5.h,
                          ),
                          buildTextField(
                              "Enter your email address", "email", "user",
                              (value) {
                            context.read<SignInBloc>().add(EmailEvent(value));
                          }),
                          reusableText("Password"),
                          SizedBox(
                            height: 5.h,
                          ),
                          buildTextField(
                              "Enter your password", "password", "lock",
                              (value) {
                            context
                                .read<SignInBloc>()
                                .add(PasswordEvent(value));
                          }),
                          forgotPassword(),
                        ],
                      ),
                    ),
                    buildLogInAndRegButton("Log In", "login", () {
                      SignInController(context: context).handleSignIn("email");
                    }),
                    buildLogInAndRegButton("Register", "register", () {
                      Navigator.of(context).pushNamed(AppRoutes.register);
                    }),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
