part of 'addnote_bloc.dart';

abstract class AddnoteState extends Equatable {
 List<Note> note;
 
  AddnoteState(
    {required this.note,}
  );
    @override
  List<Object> get props => [note];

  
}

class NoteLoaded extends AddnoteState {
  List<Note> note;
  NoteLoaded({required this.note}):super(note:note);
}

// class StatusState extends AddnoteState {
//   List<Status> status;
//   StatusState({
//     required this.status,
//   }) : super(null);
// }
