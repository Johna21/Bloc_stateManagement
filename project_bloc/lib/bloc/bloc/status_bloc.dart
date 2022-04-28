import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:project_bloc/constants/enum.dart';
import 'package:project_bloc/constants/enum.dart';
import 'package:project_bloc/constants/enum.dart';
import 'package:project_bloc/constants/status.dart';

part 'status_event.dart';
part 'status_state.dart';

class StatusBloc extends Bloc<StatusEvent, StatusState> {
  StatusBloc() : super(StatusInitial([])) {
    on<StatusActiveEvent>((event, emit) {
      emit(StatusActive(activetrue: []));
    });
    on<StatusDoneEvent>((event,emit){
      emit(StatusDone(activetrue: []));
    });
  }
}
