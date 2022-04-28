import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:project_bloc/constants/note.dart';
import 'package:project_bloc/main.dart';
import 'package:project_bloc/screens/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  
  
  LoginBloc() : super(Logininit()) {
    on<Loginsubmitted>((event, emit) async{
      
      emit(Loginsucces(state.username));
      
    });
  }
   
}
