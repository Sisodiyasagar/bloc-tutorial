import 'package:bloc/bloc.dart';
import 'package:bloc_tutorial/bloc/counter_example/counter_event.dart';
import 'package:bloc_tutorial/bloc/counter_example/counter_state.dart';

class CounterBloc extends Bloc<CounterEvent,CounterState> {

  CounterBloc() : super(CounterState()){
    on<IncrementEvent>(_increment);
    on<DecrementEvent>(_decrement);
  }
  void _increment(IncrementEvent event,Emitter<CounterState> emit) {
    emit(state.copyWith(counter: state.counter + 2));
  }
  void _decrement(DecrementEvent event,Emitter<CounterState> emit){
    emit(state.copyWith(counter: state.counter - 2));
  }

}