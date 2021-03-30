// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'file:///E:/flutter_project/signup_using_gmail_psd/lib/UI/login_screen.dart';
// import 'file:///E:/flutter_project/signup_using_gmail_psd/lib/UI/register_screen.dart';
//
// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: LoginScreen(),
//
//     );
//   }
// }

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:signup_using_gmail_psd/UI/home_screen_one.dart';
import 'file:///E:/flutter_project/signup_using_gmail_psd/lib/UI/signin/signin.dart';
import 'package:signup_using_gmail_psd/blocs/bloc_authentication/authentication_bloc.dart';
import 'package:signup_using_gmail_psd/blocs/bloc_authentication/authentication_state.dart';
import 'package:signup_using_gmail_psd/blocs/simple_bloc_observer.dart';
import 'package:signup_using_gmail_psd/repositories/user_repository.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Bloc.observer = SimpleBlocObserver();
  final UserRepository userRepository = UserRepository();

  runApp(
    BlocProvider(
      create: (context) => AuthenticationBloc(userRepository: userRepository),
      child: MyApp(
        userRepository: userRepository,
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  final UserRepository _userRepository;

  MyApp({UserRepository userRepository}) : _userRepository = userRepository;

  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocBuilder<AuthenticationBloc,AuthenticationState>(

        builder: (context, state) {

          if (state is AuthenticationFailure) {
            print ("++++++++++++++++++++++++${state.toString()}");
          return  SignInScreen(userRepository: _userRepository,);


          }
          if (state is AuthenticationSuccess) {
            print ("++++++++++++++++++++++++${state.toString()}");

            return HomeScreen(user: state.firebaseUser,);
          }
          print ("++++++++++++++++++++++++${state.toString()}");
          return  SignInScreen(userRepository: _userRepository,);

        },
      ),
    );
  }
}
