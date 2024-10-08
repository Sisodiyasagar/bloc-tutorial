import 'package:bloc_tutorial/bloc/login_example/login_bloc.dart';
import 'package:bloc_tutorial/bloc/login_example/login_event.dart';
import 'package:bloc_tutorial/bloc/login_example/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late LoginBloc login_bloc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    login_bloc = LoginBloc();
  }

  final loginfoucednodee = new FocusNode();
  final password = new FocusNode();
  final gmailcontroller=new TextEditingController();
  final passwordcontroller=new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("login using bloc state manegment"),
      ),
      body: BlocProvider(
        create: (context) => login_bloc,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: gmailcontroller,
                  focusNode: loginfoucednodee,
                  decoration: InputDecoration(
                      hintText: 'enter your email',
                      border: OutlineInputBorder()),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: passwordcontroller,
                  focusNode: password,
                  obscureText: true,
                  obscuringCharacter: '*',
                  decoration: InputDecoration(
                      hintText: 'enter your password',
                      border: OutlineInputBorder()),
                ),
              ),
              BlocListener<LoginBloc, LoginState>(
                listener: (context, state) {
                  if (state.status == LoginStatus.loading) {
                    final snackBar = SnackBar(
                      elevation: 0,
                      behavior: SnackBarBehavior.floating,
                      backgroundColor: Colors.transparent,
                      content: AwesomeSnackbarContent(
                        title: 'submitting !!',
                        message: state.message,
                        contentType: ContentType.help,
                      ),
                    );

                    ScaffoldMessenger.of(context)
                      ..hideCurrentSnackBar()
                      ..showSnackBar(snackBar);
                  }
                  if (state.status == LoginStatus.error) {
                    final snackBar = SnackBar(
                      elevation: 0,
                      behavior: SnackBarBehavior.floating,
                      backgroundColor: Colors.transparent,
                      content: AwesomeSnackbarContent(
                        title: 'login failaed !!',
                        message: state.message,
                        contentType: ContentType.failure,
                      ),
                    );

                    ScaffoldMessenger.of(context)
                      ..hideCurrentSnackBar()
                      ..showSnackBar(snackBar);
                  }
                  if (state.status == LoginStatus.success) {
                    final snackBar = SnackBar(
                      elevation: 0,
                      behavior: SnackBarBehavior.floating,
                      backgroundColor: Colors.transparent,
                      content: AwesomeSnackbarContent(
                        title: 'login success !!',
                        message: state.message,
                        contentType: ContentType.success,
                      ),
                    );

                    ScaffoldMessenger.of(context)
                      ..hideCurrentSnackBar()
                      ..showSnackBar(snackBar);
                  }
                },
                child: BlocBuilder<LoginBloc, LoginState>(
                  builder: (context, state) {
                    return Container(
                      width: double.infinity,
                      child: ElevatedButton(onPressed: () {
                        context.read<LoginBloc>().add(UserLoginEvent(gmail: gmailcontroller.text,password: passwordcontroller.text));
                      }, child: Text("login")),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
