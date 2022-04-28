part of 'status_bloc.dart';

 abstract class StatusEvent extends Equatable {
   StatusEvent();

  @override
  List<Object> get props => [];
}

class StatusActiveEvent extends StatusEvent {
  Status status;
  
  StatusActiveEvent(
    this.status,
  ) ;

  @override
  List<Object> get props => [status];

}

class StatusDoneEvent extends StatusEvent {
  NoteStatus status;
  
  StatusDoneEvent(
    this.status,
  ) ;

  @override
  List<Object> get props => [status];

}
