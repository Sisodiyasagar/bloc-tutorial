import 'package:equatable/equatable.dart';
enum LoginStatus {initial,loading,success,error}
class LoginState extends Equatable{
   final String gmail;
   final String password;
   final String message;
   final LoginStatus status;
   LoginState({
   this.gmail='',
   this.password='',
   this.message='',
   this.status=LoginStatus.initial
});

   LoginState copyWith({String? gmail,String? password,String? message,LoginStatus? status}){
      return LoginState(
         gmail: gmail ?? this.gmail,
         password: password ?? this.password,
         message: message ?? this.message,
         status: status ?? this.status
      );
   }
  @override
  List<Object> get props => [gmail, password, message, status];

}