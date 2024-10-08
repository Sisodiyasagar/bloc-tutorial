import 'package:equatable/equatable.dart';

abstract class LoginEvents extends Equatable{
  LoginEvents();
  @override
  List<Object> get props =>[];
}

class UserLoginEvent extends LoginEvents{
  late String gmail;
  late String password;
  UserLoginEvent({required this.gmail, required this.password});

  @override
  List<Object> get props =>[gmail, password];
}