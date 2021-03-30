import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:signup_using_gmail_psd/UI/signin/signin_form.dart';
import 'package:signup_using_gmail_psd/blocs/bloc_login/login_bloc.dart';
import 'package:signup_using_gmail_psd/repositories/user_repository.dart';
class SignInScreen extends StatelessWidget {
  final UserRepository userRepository;

  const SignInScreen({Key key, this.userRepository}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: BlocProvider<LoginBloc>(
        create: (context) => LoginBloc(userRepository: userRepository),
        child: Container(
          margin: const EdgeInsets.only(top: 230),
          child: SingleChildScrollView(child: LoginForm(userRepository: userRepository,)),
        ),

      ),
    );
  }
}
