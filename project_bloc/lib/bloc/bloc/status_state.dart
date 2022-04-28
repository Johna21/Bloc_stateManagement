part of 'status_bloc.dart';

abstract class StatusState extends Equatable {
  
List<Status> status;

 StatusState(this.status);
  
  @override
  List<Object> get props => [];
}
class StatusInitial extends StatusState{
  StatusInitial(List<Status> status) : super(status);

}
class StatusActive extends StatusState {
  List<Status> activetrue;
  StatusActive({
    required this.activetrue,
  }) : super(activetrue);
}
class StatusDone extends StatusState {
  List <Status> activetrue;
  StatusDone({
    required this.activetrue,
  }) : super(activetrue);
}
