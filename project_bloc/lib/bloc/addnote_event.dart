part of 'addnote_bloc.dart';

abstract class AddnoteEvent extends Equatable {
  const AddnoteEvent();

  @override
  List<Object> get props => [];
}

class AddnoteListEvent extends AddnoteEvent {
  final Note note;
  AddnoteListEvent({
    required this.note,
  });
  @override
  List<Object> get props => [note];

}

class DeleteEvent extends AddnoteEvent{
final Note note;
  DeleteEvent({
    required this.note,
  });
  @override
  List<Object> get props => [note];
}


