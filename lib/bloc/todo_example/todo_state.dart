import 'package:equatable/equatable.dart';

class TodoStates extends Equatable{
  final List<String> list;

  TodoStates({
    this.list= const []
});
  TodoStates copyWith({List<String>? list}){
    return TodoStates(
        list: list ?? this.list
    );
  }
  @override
  List<Object?> get props => [list];

}