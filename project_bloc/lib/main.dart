import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_bloc/bloc/login_bloc.dart';
import 'package:project_bloc/route/app_route.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'bloc/addnote_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final AppRoute _appRoute = AppRoute();
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginBloc>(
          create: (context) => LoginBloc(),
        ),
        BlocProvider<AddnoteBloc>(
          create: (context) => AddnoteBloc(),
        ),
         
      ],
      child: MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          onGenerateRoute: _appRoute.onGenerateRoute),
    );
  }

  @override
  void dispose() {}
}
