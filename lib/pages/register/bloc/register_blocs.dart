import 'package:e_learning_klass/pages/register/bloc/register_events.dart';
import 'package:e_learning_klass/pages/register/bloc/register_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(const RegisterState()) {
    on<EmailEvent>(_emailEvent);
    on<PasswordEvent>(_passwordEvent);
    on<RePasswordEvent>(_rePasswordEvent);
    on<PhoneNumberEvent>(_phoneNumberEvent);
    on<DateOfBirthEvent>(_dateOfBirthEvent);
    on<GenderEvent>(_genderEvent);
    on<FirstNameEvent>(_firstNameEvent);
    on<LastNameEvent>(_lastNameEvent);
  }

  void _emailEvent(EmailEvent event, Emitter<RegisterState> emit) {
    emit(state.copyWith(email: event.email));
  }

  void _passwordEvent(PasswordEvent event, Emitter<RegisterState> emit) {
    emit(state.copyWith(password: event.password));
  }

  void _rePasswordEvent(RePasswordEvent event, Emitter<RegisterState> emit) {
    emit(state.copyWith(rePassword: event.rePassword));
  }

  void _phoneNumberEvent(PhoneNumberEvent event, Emitter<RegisterState> emit) {
    emit(state.copyWith(phoneNumber: event.phoneNumber));
  }

  void _dateOfBirthEvent(DateOfBirthEvent event, Emitter<RegisterState> emit) {
    print("dateofBirth:${event.dateOfBirth}");
    emit(state.copyWith(dateOfBirth: event.dateOfBirth));
  }

  void _genderEvent(GenderEvent event, Emitter<RegisterState> emit) {
    print("gender:${event.gender}");
    emit(state.copyWith(gender: event.gender));
  }

  void _firstNameEvent(FirstNameEvent event, Emitter<RegisterState> emit) {
    emit(state.copyWith(firstName: event.firstName));
  }

  void _lastNameEvent(LastNameEvent event, Emitter<RegisterState> emit) {
    emit(state.copyWith(lastName: event.lastName));
  }
}
