import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_bloc/constants/home_parameter.dart';
import 'package:project_bloc/constants/note.dart';
import 'package:project_bloc/screens/detail_page.dart';
import 'package:project_bloc/screens/home_page.dart';
import 'package:project_bloc/screens/login_page.dart';
import 'package:project_bloc/screens/add_note.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppRoute {
   SharedPreferences? prefs;
    String? username;
  Route onGenerateRoute(RouteSettings routeSettings) {
    final args = routeSettings.arguments;
   
    switch (routeSettings.name) {
      case '/':
        return username != null ? MaterialPageRoute(builder: (_) =>
         HomePage()):
         MaterialPageRoute(builder: (_) => LoginPage());
        break;
      case LoginPage.routeName:
        return MaterialPageRoute(builder: (_) => LoginPage());
        break;
      case HomePage.routeName:
        return MaterialPageRoute(builder: (_) => HomePage(
          
        ));
        break;
      case TodoPage.routeName:
        return MaterialPageRoute(builder: (_) => TodoPage());
        break;
      case DetailPage.routeName:
        return MaterialPageRoute(builder: (_) => DetailPage(
          homeParameter: args as HomeParameter ,
        ));
        break;
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
        body: Center(
          child: Text('Error'),
        ),
      );
    });
  }

  retrieve() async{
    prefs = await SharedPreferences.getInstance();
    username = prefs!.getString('username'); 
    
  }
}
