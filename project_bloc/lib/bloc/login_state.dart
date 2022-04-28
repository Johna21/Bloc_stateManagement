part of 'login_bloc.dart';

@immutable
 class LoginState extends Equatable {
  String? username;
  
  LoginState(
    
    [this.username]
  );
  

  @override
  
  List<Object?> get props => [username];

}

class Logininit extends LoginState{
  Logininit():super();
}

class Loginsucces extends LoginState{
  Loginsucces(String? username):super(username);
}



