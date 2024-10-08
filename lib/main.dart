import 'package:bloc_tutorial/bloc/counter_example/counter_bloc.dart';
import 'package:bloc_tutorial/bloc/get_api_example/get_api_bloc.dart';
import 'package:bloc_tutorial/bloc/image_picker/image_picker_bloc.dart';
import 'package:bloc_tutorial/bloc/swich_example/swich_bloc.dart';
import 'package:bloc_tutorial/bloc/todo_example/todo_bloc.dart';
import 'package:bloc_tutorial/ui/api_example/api_screen.dart';
import 'package:bloc_tutorial/ui/counter/couter_screen.dart';
import 'package:bloc_tutorial/ui/image_picker/ImagePickerUi.dart';
import 'package:bloc_tutorial/ui/login_example/Login_Screen.dart';
import 'package:bloc_tutorial/ui/todo_example/todo_screen.dart';
import 'package:bloc_tutorial/utils/image_picker_utils.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CounterBloc(),
        ),
        BlocProvider(
          create: (context) => SwitchBloc(),
        ),
          BlocProvider(create: (context) => ImagePickerBloc(ImagePickerUtils()),),
        BlocProvider(create: (context) => TodoBloc(),),
        BlocProvider(create: (context) => GetApiBLoc(),)
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Bloc Full tutorial',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: LoginScreen(),
      ),
    );
  }
}
