import 'package:e_learning_klass/pages/common_widgets.dart';
import 'package:e_learning_klass/pages/register/bloc/register_blocs.dart';
import 'package:e_learning_klass/pages/register/bloc/register_events.dart';
import 'package:e_learning_klass/pages/register/bloc/register_states.dart';
import 'package:e_learning_klass/pages/register/register_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterBloc, RegisterState>(
      builder: (context, state) {
        return Container(
          color: Colors.white,
          child: SafeArea(
            child: Scaffold(
              backgroundColor: Colors.white,
              appBar: buildAppBar("Sign Up"),
              body: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: reusableText(
                          "Enter your details below and free sign up"),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20.h),
                      padding: EdgeInsets.only(left: 25.w, right: 25.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          reusableText("User name"),
                          buildTextField("Enter your user name", "name", "user",
                              (value) {
                            context
                                .read<RegisterBloc>()
                                .add(UserNameEvent(value));
                          }),
                          reusableText("Email"),
                          buildTextField(
                              "Enter your email address", "email", "user",
                              (value) {
                            context.read<RegisterBloc>().add(EmailEvent(value));
                          }),
                          reusableText("Password"),
                          buildTextField(
                              "Enter your password", "password", "lock",
                              (value) {
                            context
                                .read<RegisterBloc>()
                                .add(PasswordEvent(value));
                          }),
                          reusableText("Re-enter password"),
                          buildTextField("Re-enter your password to confirm",
                              "password", "lock", (value) {
                            context
                                .read<RegisterBloc>()
                                .add(RePasswordEvent(value));
                          }),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 25.w),
                      child: reusableText(
                          "By creating an account you have to agree\n with our them & condition.",
                          size: 12),
                    ),
                    buildLogInAndRegButton("Sign Up", "login", () {
                      RegisterController(context: context)
                          .handleEmailRegister();
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
