import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_bloc/bloc/addnote_bloc.dart';
import 'package:project_bloc/bloc/login_bloc.dart';
import 'package:project_bloc/constants/enum.dart';
import 'package:project_bloc/constants/note.dart';
import 'package:project_bloc/constants/status.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'home_page.dart';

class TodoPage extends StatefulWidget {
  TodoPage({Key? key}) : super(key: key);
  static const routeName = '/todo';
  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  SharedPreferences? prefs;
  String name = '';

  TextEditingController contrllertitle = new TextEditingController();
  TextEditingController controllerdescription = new TextEditingController();
  
  bool active = false;
  bool done = false;
  NoteStatus? _noteStatus;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text("Todo"),
            actions: [
              Padding(
                padding: const EdgeInsets.only(top: 8.0, right: 20),
                child: Text(
                  state.username.toString(),
                  style: TextStyle(fontSize: 23),
                ),
              )
            ],
          ),
          body: BlocBuilder<AddnoteBloc, AddnoteState>(
            builder: (context, state) {
              return Container(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Container(
                        width: 350,
                        child: TextField(
                          textInputAction: TextInputAction.newline,
                          keyboardType: TextInputType.multiline,
                          minLines: null,
                          maxLines: null,
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: BorderSide(
                                      color: Colors.black, width: 3)),
                              hintText: 'Enter your title'),
                          controller: contrllertitle,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: 350,
                        child: TextField(
                          textInputAction: TextInputAction.newline,
                          keyboardType: TextInputType.multiline,
                          minLines: null,
                          maxLines: null,
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: BorderSide(
                                      color: Colors.black, width: 3)),
                              contentPadding:
                                  EdgeInsets.symmetric(vertical: 40),
                              hintText: 'Enter your description'),
                          controller: controllerdescription,
                        ),
                      ),
                      SizedBox(
                        height: 20,

                      ),

                      Column(
                        children: [
                          CheckboxListTile(
                            title: Text("Active"),
                            value: active, 
                            onChanged: (value){
                              setState(() {
                                  active = value!;
                                  _noteStatus =NoteStatus.Active;
                                });  
                            },
                            controlAffinity: ListTileControlAffinity.leading, 
                            ),
                            CheckboxListTile(
                            title: Text("Done"),
                            value: done, 
                            onChanged: (value){
                                setState(() {
                                  
                                  done = value!;
                                  _noteStatus = NoteStatus.Done;
                                });
                            },
                            controlAffinity: ListTileControlAffinity.leading, 
                            ),
                        ],
                      ),
                      ElevatedButton(
                          onPressed: () {
                             
                                 
                            
                            
                              Navigator.of(context).pushReplacementNamed(
                                HomePage.routeName,
                                
                              );
                               BlocProvider.of<AddnoteBloc>(context).
                              add(AddnoteListEvent(note: Note(
                                body: controllerdescription.text,
                                title: contrllertitle.text, 
                                noteStatus: _noteStatus!,
                                
                              )));
                             

                              
                          },
                          child: Text('Save'))
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }

  retrieve() async {
    prefs = await SharedPreferences.getInstance();
    var namel = prefs!.getString('username')!;
    setState(() {
      name = namel;
    });
  }
}
