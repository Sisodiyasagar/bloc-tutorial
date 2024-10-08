import 'package:bloc/bloc.dart';
import 'package:bloc_tutorial/bloc/todo_example/todo_event.dart';
import 'package:bloc_tutorial/bloc/todo_example/todo_state.dart';

class TodoBloc extends Bloc<TodoEvents,TodoStates>{
  List<String> temp=[];
  TodoBloc() : super(TodoStates()){
    on<addToList>(addd);
    on<removeFromList>(removee);
    on<updateList>(updatee);
  }
  void addd(addToList events,Emitter<TodoStates> emit){
    temp.add(events.name);
    emit(state.copyWith(list: List.from(temp) ));
  }
  void removee(removeFromList events,Emitter<TodoStates> emit){
      temp.removeAt(events.index);
      emit(state.copyWith(list: List.from(temp)));
  }
  void updatee(updateList events,Emitter<TodoStates> emit){
      temp[events.index]=events.name;
      emit(state.copyWith(list: List.from(temp)));
  }
}