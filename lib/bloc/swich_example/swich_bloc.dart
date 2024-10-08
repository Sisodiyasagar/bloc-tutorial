import 'package:bloc/bloc.dart';
import 'package:bloc_tutorial/bloc/swich_example/swich_event.dart';
import 'package:bloc_tutorial/bloc/swich_example/swich_state.dart';

class SwitchBloc extends Bloc<SwitchEvent, SwitchState> {
  SwitchBloc() : super(SwitchState()) {
    on<SwitchOnoroffEvent>(_switchonoroff);
    on<SliderEvent>(_slider);
  }

  void _switchonoroff(SwitchOnoroffEvent event, Emitter<SwitchState> emit) {
    emit(state.copyWith(value: !state.ison));
  }
  void _slider(SliderEvent event, Emitter<SwitchState> emit){
    emit(state.copyWith(value1: event.slider));
  }
}
