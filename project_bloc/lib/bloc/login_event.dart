part of 'login_bloc.dart';

@immutable
abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class Loginsubmitted extends LoginEvent {}

class LoginnotSubmitted extends LoginEvent{}
