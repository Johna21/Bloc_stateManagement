import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_bloc/bloc/addnote_bloc.dart';
import 'package:project_bloc/bloc/login_bloc.dart';
import 'package:project_bloc/constants/enum.dart';
import 'package:project_bloc/constants/home_parameter.dart';
import 'package:project_bloc/constants/note.dart';
import 'package:project_bloc/constants/status.dart';
import 'package:project_bloc/screens/detail_page.dart';
import 'package:project_bloc/screens/add_note.dart';
import 'package:shared_preferences/shared_preferences.dart';

                  bool? valuefirst=false;

class HomePage extends StatefulWidget {
  HomePage({
    Key? key,
  }) : super(key: key);
  static const routeName = '/home';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  SharedPreferences? prefs;
  String? name;

  // NoteStatus? status;

  @override
  Widget build(BuildContext context) {
    String? username;
    bool statevalue = false;
    Status statutype;
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(state.username.toString()),
          ),
          body: BlocBuilder<AddnoteBloc, AddnoteState>(
            builder: (context, state) {
              return ListView.builder(
                itemCount: state.note.length,
                itemBuilder: (BuildContext context, int index) {
                  Note? userdata;
                  var result = state.note[index].noteStatus;
                  return Dismissible(
                    key: Key("${state.note[index]}"),
                    onDismissed: (DismissDirection direction) {
                      if (direction == DismissDirection.startToEnd) {
                        print("add to favorite");
                      } else {
                        final snackBar = SnackBar(
                          content: Text("Item ${state.note[index]} is removed"),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }

                      setState(() {
                        BlocProvider.of<AddnoteBloc>(context).add(DeleteEvent(
                            note: Note(
                                body: state.note[index].body,
                                title: state.note[index].title,
                                noteStatus: state.note[index].noteStatus
                                )));
                      });
                    },
                    child: GestureDetector(
                      child: (state.note.length == 0)
                          ? Padding(
                              padding:
                                  const EdgeInsets.only(top: 60, bottom: 38.0),
                              child: Center(child: Text("No Note List")),
                            )
                          : Container(
                            
                            child: Container(
                              color: (result == NoteStatus.Active)?
                                Colors.red:
                              Colors.amberAccent,
                              child: ListTile(
                                  leading: Icon(Icons.list),
                                  

                                  title: Text(state.note[index].title,
                                    style: TextStyle(),
                                  ),

                                  subtitle: Text(state.note[index].body),
                                 
                                    trailing: Text(result.toString()),   
                                    
                                  
                                 
                                  onTap: () {
                                   
                                    Navigator.of(context).pushNamed(
                                        DetailPage.routeName,
                                        arguments: HomeParameter(
                                            title: "List item ",
                                            description: "description",
                                            index: index));
                                  },
                                ),
                            ),
                          ),
                    ),
                  );
                },
              );
            },
            
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.of(context).pushNamed(
                TodoPage.routeName,
              );
            },
            tooltip: 'Increment',
            child: Icon(Icons.add),
          ),
        );
      },
    );
  }
  void _getchechbox(){
   List.generate(10, (index) {
     Checkbox(
       value: valuefirst,
       onChanged: (bool? value){
         setState(() {
           valuefirst = value;
         });
       },
     );
   });          
}

  retrieve() async {
    prefs = await SharedPreferences.getInstance();
    name = prefs!.getString('username');
    setState(() {});
  }
}
