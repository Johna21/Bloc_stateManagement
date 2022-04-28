
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_bloc/bloc/login_bloc.dart';
import 'package:project_bloc/constants/note.dart';
import 'package:project_bloc/screens/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

String UsernameLogin = '';
class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);
  static const routeName = '/login'; 

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  Pattern pattern =
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]"
        r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?)*$";
  TextEditingController contrllerUsername = new  TextEditingController();
  TextEditingController controllerpassword = new  TextEditingController();
  SharedPreferences? prefs;
  String username ='';
  @override
  void dispose()
      {
        contrllerUsername.dispose();
        controllerpassword.dispose();
      }
  Widget build(BuildContext context) {
     
    return Material(
      child: CupertinoPageScaffold(
        child: Form(
          key: formkey,
          child: Padding(
            
            padding: EdgeInsets.only(
              top:120,
              left: 20,
              right: 20,
              bottom: 20,
              ),
            child: Center(
              
              child: SingleChildScrollView(
                child: Container(
                  margin: EdgeInsets.only(top: 40),
                 height: 300,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                      width: 5,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),

                  child: Column(
                    children: [
                      Text("Login",
                      style: TextStyle(
                    color: Colors.grey[800],
                    fontWeight: FontWeight.bold,
                    fontSize: 40)
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText:'Enter UserName',
                          prefixIcon: Icon(Icons.email)
                        ),
                        controller: contrllerUsername,
                        validator: (value){
                          if(value!.isEmpty ){
                            return "Enter Correct UserName";
                            
                          }else{
                            return null;
                            
                          }
                        }
                        ),
                      
                      SizedBox(height: 20,),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText:'Enter password',
                          
                          prefixIcon: Icon(Icons.lock_open)
                        ),
                        obscureText: true,
                        autofocus: true,
                        controller: controllerpassword,
                        validator: (password){
                          if(password == null || password.isEmpty){
                            return "Enter Valid password";
                          }else if(password.length<6){
                            return "The password at least 6 character";
                          }
                          else{
                            return null;
                          }
                        }
                        ),
                      // CupertinoTextField(
                      //   textInputAction: TextInputAction.next,
                      //   obscureText: true,
                      //   placeholder: "enter password",
                      //   controller: controller,
                         
                      // ),
                      SizedBox(height: 20,),
                      
                      TextButton(
                        child: Text('Login'),
                         onPressed: (){
                           if(!formkey.currentState!.validate()){
                              return ;
                           }
                          Navigator.of(context).pushNamedAndRemoveUntil
                          (HomePage.routeName,
                           (route) => false,
                             
                           );
                           BlocProvider.of<LoginBloc>(context)..state.username = contrllerUsername.text ;
                        // BlocProvider.of<LoginBloc>(context).add(Loginsubmitted());

                         }
                         ),
                      
                    ],
                  ),
                ),
              ),
            )
            
            ),
        ),
          ),
    );
    
  }
  save() async{
    prefs = await SharedPreferences.getInstance();
    prefs!.setString("username", contrllerUsername.text.toString());
    
  }
  getuser()async{
    prefs = await SharedPreferences.getInstance();
     final String  username = prefs!.getString('username').toString();
    setState(() {
      UsernameLogin = prefs!.getString('username').toString();
    });
  }
}