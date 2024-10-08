import 'package:bloc/bloc.dart';
import 'package:bloc_tutorial/bloc/login_example/login_event.dart';
import 'package:bloc_tutorial/bloc/login_example/login_state.dart';
import 'package:http/http.dart' as http;

class LoginBloc extends Bloc<LoginEvents,LoginState>{

  LoginBloc():super(LoginState()){
    on<UserLoginEvent>(_login);
  }

  Future<void> _login(UserLoginEvent event,Emitter<LoginState> emit) async {
    Map<String,dynamic> data={
      'email':event.gmail,
      'password':event.password
    };
  emit(state.copyWith(
    status: LoginStatus.loading
  ));
    try{
      final response = await http.post(Uri.parse('https://reqres.in/api/login'),body: data);
      if(response.statusCode == 200){
        emit(state.copyWith(
          status: LoginStatus.success,
          message: "Login successful"
        ));

      }else{
        emit(state.copyWith(
          status: LoginStatus.error,
          message: "Login failed"
        ));
      }
    }catch(e){
      emit(state.copyWith(
        message: e.toString()
      ));
    }

  }
}