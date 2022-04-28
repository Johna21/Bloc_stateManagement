import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:project_bloc/bloc/addnote_bloc.dart';
import 'package:project_bloc/bloc/login_bloc.dart';
import 'package:project_bloc/constants/home_parameter.dart';
import 'package:project_bloc/screens/home_page.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({
    Key? key,
    required this.homeParameter,
  }) : super(key: key);
final HomeParameter homeParameter;
  static const routeName = '/detail';
  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    var homeParameter = widget.homeParameter;
     return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(state.username.toString()),
          ),
          body: BlocBuilder<AddnoteBloc, AddnoteState>(
            builder: (context, state) {
              int index = homeParameter.index;
              
              return Column(
                children: [
                  Center(
                    child: Text(state.note[index].title),
                  ),
                  Center(
                    child: Text(state.note[index].body),
                  ),
                  SizedBox(height: 30,)
                  
                ],
              );
            },
          ),
        );
      },
    );
  }
}

// class DetailPage extends StatelessWidget {
//   const DetailPage({Key? key, required this.homeParameter}) : super(key: key);
//   final HomeParameter homeParameter;
//   static const routeName = '/detail';
//   @override
//   Widget build(BuildContext context) {
  

//     return BlocBuilder<LoginBloc, LoginState>(
//       builder: (context, state) {
//         return Scaffold(
//           appBar: AppBar(
//             title: Text(state.username.toString()),
//           ),
//           body: BlocBuilder<AddnoteBloc, AddnoteState>(
//             builder: (context, state) {
//               int index = homeParameter.index;
//               return Column(
//                 children: [
//                   Center(
//                     child: Text(state.note[index].title),
//                   ),
//                   Center(
//                     child: Text(state.note[index].body),
//                   ),
//                   SizedBox(height: 30,)
                  
//                 ],
//               );
//             },
//           ),
//         );
//       },
//     );
//   }
// }
