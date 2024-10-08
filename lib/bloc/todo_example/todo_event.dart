import 'package:equatable/equatable.dart';

abstract class TodoEvents extends Equatable{
  @override
  List<Object> get props => [];
}
class addToList extends TodoEvents{
String name;
addToList({required this.name});
@override
  List<Object> get props => [name];

}
class removeFromList extends TodoEvents{
int index;
removeFromList({required this.index});
@override
  List<Object> get props => [index];
}
class updateList extends TodoEvents{
int index;
String name;

updateList({required this.name, required this.index});

@override
  List<Object> get props => [name, index];
}