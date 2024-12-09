import 'package:e_learning_klass/common/values/colors.dart';
import 'package:e_learning_klass/pages/common_widgets.dart';
import 'package:e_learning_klass/pages/register/bloc/register_blocs.dart';
import 'package:e_learning_klass/pages/register/bloc/register_events.dart';
import 'package:e_learning_klass/pages/register/bloc/register_states.dart';
import 'package:e_learning_klass/pages/register/register_controller.dart';
import 'package:e_learning_klass/pages/register/widgets/register_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  DateTime? _selectedDate; //save date of Birth

  String _selectedGender = '';
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
                          reusableText("First name"),
                          buildTextField(
                              "Enter your first name", "name", "user", (value) {
                            context
                                .read<RegisterBloc>()
                                .add(FirstNameEvent(value));
                          }),
                          reusableText("Last name"),
                          buildTextField("Enter your last name", "name", "user",
                              (value) {
                            context
                                .read<RegisterBloc>()
                                .add(LastNameEvent(value));
                          }),
                          reusableText("Email"),
                          buildTextField(
                              "Enter your email address", "email", "email",
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
                          reusableText("Phone number"),
                          buildTextField(
                              "Enter your phone number", "phone", "phone-call",
                              (value) {
                            context
                                .read<RegisterBloc>()
                                .add(PhoneNumberEvent(value));
                          }),
                          reusableText("Date of Birth"),
                          GestureDetector(
                            onTap: () => selectDate(context, (pickedDate) {
                              setState(() {
                                _selectedDate = pickedDate;
                              });
                              String formattedDate = DateFormat('yyyy-MM-dd')
                                  .format(_selectedDate!);
                              context
                                  .read<RegisterBloc>()
                                  .add(DateOfBirthEvent(formattedDate));
                            }),
                            child: Container(
                              width: 325.w,
                              height: 50.h,
                              margin: EdgeInsets.only(bottom: 5.h),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(15.w),
                                ),
                                border: Border.all(
                                    color: AppColors.primaryFourthElementText),
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    width: 16.w,
                                    margin: EdgeInsets.only(left: 17.w),
                                    height: 16.w,
                                    child: const Icon(
                                      Icons.calendar_today,
                                      size: 18,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 270.w,
                                    height: 50.h,
                                    child: TextField(
                                      controller: TextEditingController(
                                          text: _selectedDate != null
                                              ? _selectedDate
                                                  .toString()
                                                  .substring(0, 10)
                                              : ''),
                                      readOnly: true,
                                      decoration: InputDecoration(
                                        hintText: "Select your birth date",
                                        border: const OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.transparent),
                                        ),
                                        enabledBorder: const OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.transparent),
                                        ),
                                        disabledBorder:
                                            const OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.transparent),
                                        ),
                                        focusedBorder: const OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.transparent),
                                        ),
                                        hintStyle: TextStyle(
                                          fontWeight: FontWeight.normal,
                                          fontSize: 14.sp,
                                          color: AppColors
                                              .primarySecondaryElementText,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          reusableText("Gender"),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              genderButton('Male', 'MALE', _selectedGender,
                                  (value) {
                                setState(() {
                                  _selectedGender = value;
                                });
                                context
                                    .read<RegisterBloc>()
                                    .add(GenderEvent(_selectedGender));
                              }),
                              genderButton('Female', 'FEMALE', _selectedGender,
                                  (value) {
                                setState(() {
                                  _selectedGender = value;
                                });
                                context
                                    .read<RegisterBloc>()
                                    .add(GenderEvent(_selectedGender));
                              }),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 25.w),
                      child: reusableText(
                          "By creating an account you agree to our Terms & Conditions.",
                          size: 12),
                    ),
                    buildLogInAndRegButton("Sign Up", "login", () {
                      // Gọi phương thức đăng ký từ RegisterController
                      RegisterController(context: context)
                          .handleEmailRegister();
                    }),
                    SizedBox(
                      height: 40.h,
                    )
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
