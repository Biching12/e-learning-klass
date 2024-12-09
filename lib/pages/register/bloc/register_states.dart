// ignore_for_file: public_member_api_docs, sort_constructors_first
class RegisterState {
  final String email;
  final String password;
  final String rePassword;
  final String phoneNumber;
  final String dateOfBirth;
  final String gender;
  final String firstName;
  final String lastName;
  const RegisterState({
    this.email = "",
    this.password = "",
    this.rePassword = "",
    this.phoneNumber = "",
    this.dateOfBirth = "",
    this.gender = "",
    this.firstName = "",
    this.lastName = "",
  });
  RegisterState copyWith({
    String? email,
    String? password,
    String? rePassword,
    String? phoneNumber,
    String? dateOfBirth,
    String? gender,
    String? firstName,
    String? lastName,
  }) {
    return RegisterState(
      email: email ?? this.email,
      password: password ?? this.password,
      rePassword: rePassword ?? this.rePassword,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      gender: gender ?? this.gender,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
    );
  }
}
