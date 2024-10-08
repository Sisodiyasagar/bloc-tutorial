import 'package:equatable/equatable.dart';

class SwitchState extends Equatable {
  bool ison;
  double slide;

  SwitchState({this.ison = false,this.slide=0.0});

  SwitchState copyWith({bool? value,double? value1}) {
    return SwitchState(ison: value ?? this.ison,slide: value1 ?? this.slide);
  }

  @override
  List<Object?> get props => [ison,slide];
}
