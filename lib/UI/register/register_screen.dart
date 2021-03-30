
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:signup_using_gmail_psd/UI/register/register_form.dart';
import 'package:signup_using_gmail_psd/blocs/register_bloc/register_bloc.dart';
import 'package:signup_using_gmail_psd/repositories/user_repository.dart';

class RegisterScreen extends StatelessWidget {
  final UserRepository _userRepository;

  const RegisterScreen({Key key, UserRepository userRepository})
      : _userRepository = userRepository,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: BlocProvider<RegisterBloc>(
        create: (context) => RegisterBloc(userRepository: _userRepository),
        child:Container(
          margin: const EdgeInsets.only(top: 230),
          child: SingleChildScrollView(child: RegisterForm()),
        )
      ),
    );
  }
}
