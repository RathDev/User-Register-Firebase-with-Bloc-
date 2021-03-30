import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:signup_using_gmail_psd/blocs/bloc_authentication/authentication_bloc.dart';
import 'package:signup_using_gmail_psd/blocs/bloc_authentication/authentication_event.dart';

class HomeScreen extends StatelessWidget {
  final User user;

  const HomeScreen({Key key, this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () {
              BlocProvider.of<AuthenticationBloc>(context)
                  .add(AuthenticationLoggedOut());
            },
          )
        ],
      ),
      body: Column(
        children: <Widget>[
          Center(
            child: Text("Your email : ${user.email}"),
          ),
          Center(
            child: Text("Your ID : ${user.uid}"),
          ),
        ],
      ),
    );
  }
}
