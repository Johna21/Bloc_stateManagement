import 'package:equatable/equatable.dart';
import 'package:project_bloc/constants/enum.dart';


class Note extends Equatable{
  String title;
  String body;
  NoteStatus noteStatus;
  Note({
    required this.body,
    required this.title,
    required this.noteStatus

  });

  @override
  // TODO: implement props
  List<Object?> get props => [title,body,noteStatus];

  
}