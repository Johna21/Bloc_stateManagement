import 'package:equatable/equatable.dart';

import 'package:project_bloc/constants/enum.dart';

class Status extends Equatable {
  NoteStatus status;
  Status({
    required this.status,
  });
  
  @override
  // TODO: implement props
  List<Object?> get props => [status];

}
