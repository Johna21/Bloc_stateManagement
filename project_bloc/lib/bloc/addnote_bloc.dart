import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:project_bloc/constants/enum.dart';
import 'package:project_bloc/constants/note.dart';
import 'package:project_bloc/constants/status.dart';

part 'addnote_event.dart';
part 'addnote_state.dart';

class AddnoteBloc extends Bloc<AddnoteEvent, AddnoteState> {
  AddnoteBloc() : super(NoteLoaded(note: [])) {
    on<AddnoteListEvent>((event, emit) {
      emit(NoteLoaded(note: List.from(state.note)..add(event.note)));
    });
    on<DeleteEvent>((event, emit) {
      emit(NoteLoaded(note: List.from(state.note)..remove(event.note)));
    });
  }
}
